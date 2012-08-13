require 'spec_helper'

describe Github::Crisply::Client do 
  let(:client) { Github::Crisply::Client.new({:account => 'testou', :token => 'W0TLPnbZJgiGPegO4gr5'}, true) }
  context "When I send credentials to Crisply" do 
    before(:each) do 
      stub_get("https://W0TLPnbZJgiGPegO4gr5:%20@testou.crisply.com/api/test.xml", "200")
      stub_post("https://W0TLPnbZJgiGPegO4gr5:%20@testou.crisply.com/api/activity_items.xml", "201")
    end
    subject { client }
    its(:connected?) { should be_true}

    describe :create_activity do 
      let(:data) { {:project_id => 26005, :text => "Testing Data Publishing"} }
      subject { client.create_activity data }
      its(:status) { should == 201 }
    end
  end
end
