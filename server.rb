require 'sinatra'
require 'sinatra/activerecord'
require 'httparty'
require "json"
require 'date'
enable :sessions

set :database, "sqlite3:lifefeed.sqlite3"

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
  redirect :login
end

get '/login' do
  erb :login
end

post '/login' do
  email = params['email']
  given_password = params['password']
  post = Post
  user = User.find_by(email: email)
  if user.password == given_password
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



require './models'
