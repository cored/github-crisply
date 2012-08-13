require 'rubygems'
require 'sinatra/base'

module Github
  module Crisply

    class Server < Sinatra::Base
      post '/' do 
        push = params[:payload]
        PayloadProcessor.new(push).process
      end
    end
  end
end
