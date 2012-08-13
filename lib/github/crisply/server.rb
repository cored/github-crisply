require 'rubygems'
require 'json'
require 'sinatra/base'

module Github
  module Crisply
    class PayloadProcessor
      attr_accessor :payload, :template, :factory

      protected :payload, :payload=, :template, :template=, :factory, :factory=

      def initialize(payload, factory = Factory.new) 
        self.payload = payload
        self.factory = factory
        self.template = self.payload
      end

      def process
        client.create_activity(:text => template,
                               :project_id => config.project_id)
      end

      def template
        "Github Repository: #{self.payload["repository"]["name"]}"
      end

      def payload=(data)
        data = JSON.parse(data)
        config = factory.config_handler
        client = factory.crisply_client(config.account, config.username)
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
