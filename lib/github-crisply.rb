require "github-crisply/version"
require 'rubygems'
require 'faraday'
require 'faraday_middleware'

module Github
  module Crisply
    class Client

      def initialize(credentials, debug = false)
        @connection = Faraday.new :url => "https://#{credentials[:account]}.crisply.com/api/" do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.basic_auth credentials[:token], ''
          faraday.response :logger if debug
          faraday.response :xml,          :content_type => /\bxml$/
          faraday.response :mashify,      :content_type => /\bxml$/
        end
      end

      def connected?
        @connection.get('test.xml').status == 200
      end
    end
  end
end
