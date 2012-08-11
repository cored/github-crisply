require 'rubygems'
require 'sinatra/base'

class Server < Sinatra::Base
   get '/' do 
    "Success: #{@payload}"
   end

   post '/' do 
     @payload = params[:payload]
     redirect "/" 
   end
end
