require 'rubygems'
require 'sinatra'

class Server
  post '/' do 
    params[:payload]
  end
end
