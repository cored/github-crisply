require 'rubygems'
require 'sinatra/base'

module Github
  module Crisply

    class Server < Sinatra::Base
      post '/' do 
        PayloadProcessor.new(params[:payload]).process
      end
    end
  end
end
