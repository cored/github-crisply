require 'spec_helper'

def app
  Sinatra::Application
end

describe Github::Crisply::Server do 
  include Rack::Test::Methods
  
  pending "should publish a payload" do 
    post '/', :payload => "{commit : 'test'}"
    last_response.should == ''
  end
end
