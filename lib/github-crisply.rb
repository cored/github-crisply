require "github-crisply/version"
require 'rubygems'
require 'faraday'
require 'faraday_middleware'
require 'nokogiri'
require 'sinatra/base'

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
        data.merge!(:guid => guid)
        puts "Request: #{xml_builder(data)}"
        @connection.post('activity-items.xml', xml_builder(data))
      end

      protected
      def guid
        "post-activity-#{Time.now.to_f}-#{Kernel.rand(2**64)}"
      end

      def xml_builder(data)
        Nokogiri::XML::Builder.new do |xml|
          xml.send('activity-item', 
                   'xmlns' => 'http://crisply.com/api/v1') do
            [:guid, :text].each do |attribute|
              value = data[attribute]
              xml.send(format_xml_node(attribute), value) unless value.nil?
            end
          end
        end.to_xml
      end

      def format_xml_node(name)
        "#{name.to_s.gsub('_','-')}_".to_sym
      end

    end
  end
end
