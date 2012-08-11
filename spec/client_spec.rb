require 'spec_helper'

describe Github::Crisply::Client do 
  context "When I send credentials to Crisply" do 
    subject { Github::Crisply::Client.new({:account => 'testou', 
                                          :token => 'W0TLPnbZJgiGPegO4gr5'}, true) }
    its(:connected?) { should be_true}
  end
end
