require 'rubygems'
require 'sinatra/base'

class Server < Sinatra::Base
   post '/' do 
     @payload = params[:payload]
     "It worked"
   end
end
