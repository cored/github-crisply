require 'spec_helper'

describe Github::Crisply::ConfigHandler do 
  let(:config_handler) { Github::Crisply::ConfigHandler.new }

  context "When I try to extract info from the configuration file" do 
    subject { config_handler }
    its(:config) { should be_kind_of Hash}

    describe :account do 
      its(:account) { should == "testou" }
    end

    describe :token do 
      its(:token) { should == "W0TLPnbZJgiGPegO4gr5" }
    end

    describe :project_id do 
      its(:project_id) { should == 26005 }
    end
  end

end
