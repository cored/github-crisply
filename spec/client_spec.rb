require 'spec_helper'

describe Github::Crisply::Client do 
  let(:client) { Github::Crisply::Client.new({:account => 'testou', :token => 'W0TLPnbZJgiGPegO4gr5'}, true) }
  pending "When I send credentials to Crisply" do 
    subject { client }
                                          
    its(:connected?) { should be_true}

    describe :create_activity do 
      let(:data) { {:guid => "post-activity-#{Time.now.to_f}-#{Kernel.rand(2**64)}",
                    :project_id => 24735,
                    :text => "Testing Data Publishing"} }
      subject { client.create_activity data }
      it { should == ''}
    end
  end
end
