require 'spec_helper'

describe Github::Crisply::Client do 
  let(:client) { Github::Crisply::Client.new({:account => 'testou', :token => 'W0TLPnbZJgiGPegO4gr5'}, true) }
  context "When I send credentials to Crisply" do 
    subject { client }
                                          
    its(:connected?) { should be_true}

    describe :create_activity do 
      let(:data) { {:text => "Testing Data Publishing"} }
      subject { client.create_activity data }
      it { should == ''}
    end
  end
end
