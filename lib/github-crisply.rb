require "github-crisply/version"
require 'rubygems'
require 'faraday'
require 'faraday_middleware'
require 'nokogiri'
require 'sinatra'

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
        true
        #@connection.get('test.xml').status == 200
      end

      def create_activity(data)
        @connection.post('activity-items.xml', xml_builder(data))
      end

      protected
      def xml_builder(data)
         Nokogiri::XML::Builder.new do |xml|
          xml.send('activity-item', 'xmlns' => 'http://crisply.com/api/v1') do
            [:guid, :text].each do |attribute|
              value = data[attribute.to_sym]
              xml.send(attribute, value)
            end
          end
        end.to_xml
      end
    end
  end
end
