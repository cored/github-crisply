require 'rubygems'
require 'sinatra/base'

class Server < Sinatra::Base
   get '/' do 
     "Server running"
   end

   post '/' do 
     @payload = params[:payload]
     "It worked"
   end
end
