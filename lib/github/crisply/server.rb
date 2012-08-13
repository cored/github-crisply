require 'rubygems'
require 'json'
require 'sinatra/base'

module Github
  module Crisply
    class Server < Sinatra::Base
      post '/' do 
        push = JSON.parse(params[:payload])
        process_payload(push)
      end

      protected
      def process_payload(data)
        config = ConfigHandler.new
        client = Client.new(:account => config.account, 
                            :username => config.username)

        template = "Github Repository: #{data['repository']} activity - Author: #{data['commit']['author']} Message: #{data['commit']['message']}"
        client.create_activity(:text => template,
                               :project_id => config.project_id)
                               
      end

    end
  end
end
