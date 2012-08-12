require 'rubygems'
require 'json'
require 'sinatra/base'

class Server < Sinatra::Base
   get '/' do 
     "Server running"
   end

   post '/' do 
     push = JSON.parse(params[:payload])
     "I got some JSON: #{push.inspect}" 
   end
end
