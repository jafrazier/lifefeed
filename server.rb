require 'sinatra'
require 'sinatra/activerecord'
require 'httparty'
require "json"
enable :sessions


get '/' do
  erb :home
end
