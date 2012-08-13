require 'spec_helper'

describe Github::Crisply::ConfigHandler do 
  let(:config_handler) { Github::Crisply::ConfigHandler.new }

  context "When I try to extract info from the configuration file" do 
    subject { config_handler }
    its(:config) { should be_kind_of Hash}

    describe :account do 
      its(:account) { should == "testou" }
    end

    describe :username do 
      its(:username) { should == "W0TLPnbZJgiGPegO4gr5" }
    end
  end

end
