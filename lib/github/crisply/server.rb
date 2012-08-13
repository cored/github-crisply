require 'rubygems'
require 'json'
require 'sinatra/base'

module Github
  module Crisply
    class Server < Sinatra::Base
      post '/' do 
        push = JSON.parse(params[:payload])
        "Payload Sent: #{push}"
      end
    end
  end
end
