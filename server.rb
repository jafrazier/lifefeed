require 'sinatra'
require 'sinatra/activerecord'
require 'httparty'
require "json"
enable :sessions

set :database, "sqlite3:lifefeed.sqlite3"

get '/' do
  erb :home
end


require './models'
