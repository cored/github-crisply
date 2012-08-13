require 'rubygems'
require 'rspec'
require 'fakeweb'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = 'documentation'
end

FakeWeb.allow_net_connect = false

def stub_request(method, url, status=nil)
  options = {:body => ""}
  if status
    options.merge!(:body => status) 
    options.merge!(:status => status)
  end
  FakeWeb.register_uri(method, url, options)
end

def stub_get(*args); stub_request(:get, *args) end
def stub_post(*args); stub_request(:post, *args) end

require_relative '../lib/github-crisply'
