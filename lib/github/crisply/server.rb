require 'rubygems'
require 'json'
require 'sinatra/base'

module Github
  module Crisply
    class PayloadProcessor
      def initialize(payload, factory = Factory.new) 
        @factory = factory
        @payload = JSON.parse(payload)
        @config = factory.config_handler
      end

      def process
        @factory.crisply_client(@config.account,
                                @config.token).create_activity(:text => template,
                                                        :project_id => @config.project_id)
      end

      def template
        "Github Repository: #{@payload["repository"]["name"]}"
      end
    end

    class Server < Sinatra::Base
      post '/' do 
        push = params[:payload]
        PayloadProcessor.new(push).process
      end
    end
  end
end
