require 'sinatra'
require 'sinatra/activerecord'
require 'httparty'
require "json"
require 'date'
enable :sessions
require 'active_record'
set :database, "sqlite3:lifefeed.sqlite3"
# ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

get '/' do
  erb :home
end

get '/signup' do
  erb :signup
end

post '/signup' do
  p params
  user = User.new(
    first_name: params['first_name'],
    last_name: params['last_name'],
    birthday: params['birthday'],
    email: params['email'],
    password: params['password']
  )
  user.save
  session[:user] = user
  redirect :member
end

get '/login' do
  erb :login
end

post '/login' do
  email = params['email']
  given_password = params['password']
  user = User.find_by(email: email)
  if user == nil
    redirect '/'
  elsif user.password == given_password
    session[:user] = user
    redirect :member
  else
    p 'invalid'
    redirect '/'
  end

end

get '/member' do

  erb :member
end

post '/member' do
  d= DateTime.now
  newpost = Post.new(
    post_url: params['image'],
    by: session[:user].first_name,
    message: params['message'],
    created_at: d.strftime("posted on %m/%d/%Y"),
    foriegn_id: session[:user].id
  )
  newpost.save
  erb :member
end

get '/logout' do
  session[:user] = nil
  p 'user has been logged out'
  redirect '/'
end

get '/delete' do
  current = session[:user].id
  user = User.find_by(id: current)
  postD = Post.where(foriegn_id: current)
  postD.each do |post|
    post.destroy
  end
  user.destroy
  redirect '/'
end

get '/postdelete' do
  post = Post.all
  post.each do |posts|
    posts.destroy
  end
  redirect :member
end



require './models'
