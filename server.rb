require 'rubygems'
require 'json'
require 'sinatra/base'

class Server < Sinatra::Base
   post '/' do 
     push = JSON.parse(params[:payload])
     "I got some JSON: #{push.inspect}" 
   end
end
