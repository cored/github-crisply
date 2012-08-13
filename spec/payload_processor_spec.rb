require 'spec_helper'

describe Github::Crisply::PayloadProcessor do 
  let(:payload) do
    fixture_file('sample_payload.json')
  end
  let(:processor) { Github::Crisply::PayloadProcessor.new(payload) }

  context "When I sent valid json payload" do 
    subject { processor }
    its(:payload) { should == '' }
  end
end
