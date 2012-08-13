require 'json'

module Github
  module Crisply
    class PayloadProcessor
      def initialize(payload, factory = Factory.new) 
        @factory = factory
        @payload = JSON.parse(payload)
        @config = factory.config_handler
      end


      def process
        @payload["commits"].each do |commit|
          execute_client(commit)
        end
      end

      def execute_client(commit)
        @factory.crisply_client(@config.account,
                                @config.token).create_activity(
        :text => "Github Repository: #{@payload['repository']['name']} - Author: #{commit['author']['name']} - Message: #{commit['message']}",
        :project_id => @config.project_id)
      end
    end
  end
end
