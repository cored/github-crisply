require 'rubygems'
require 'faraday'
require 'faraday_middleware'
require 'nokogiri'

module Github
  module Crisply
    class Client
      REQUEST_XML_NODES = [:guid, :text]

      def initialize(credentials, debug = false)
        @connection = Faraday.new :url => "https://#{credentials[:account]}.crisply.com/api/" do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.basic_auth credentials[:token], ' '
          faraday.response :logger if debug
          faraday.response :xml,          :content_type => /\bxml$/
          faraday.response :mashify,      :content_type => /\bxml$/
        end
      end

      def connected?
        @connection.get('test.xml').status == 200
      end

      def create_activity(data)
        data.merge!(:guid => guid)
        @connection.post('activity_items.xml') do |req|
          req.headers['Content-Type'] = 'application/xml'
          req.body = xml_builder(data)
        end
      end

      protected
      def guid
        "post-activity-#{Time.now.to_f}-#{Kernel.rand(2**64)}"
      end

      def xml_builder(data)
        Nokogiri::XML::Builder.new do |xml|
          xml.send('activity-item', 
                   'xmlns' => 'http://crisply.com/api/v1') do
            add_values_to_xml_nodes(data, xml)
          end
        end.to_xml
      end

      def add_values_to_xml_nodes(data, xml)
        REQUEST_XML_NODES.each do |attribute|
          value = data[attribute]
          xml.send(format_xml_node(attribute), value) unless value.nil?
        end
        xml
      end

      def format_xml_node(name)
        "#{name.to_s.gsub('_','-')}_".to_sym
      end
    end
  end
end
