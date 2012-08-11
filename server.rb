require 'rubygems'
require 'sinatra/base'

class Server < Sinatra::Base
   post '/' do 
     params[:payload]
   end
end
