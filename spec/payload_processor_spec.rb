require 'spec_helper'

describe Github::Crisply::PayloadProcessor do 
  let(:payload) do
    fixture_file('sample_payload.json')
  end
  before(:each) do 
    stub_post("https://:%20@testou.crisply.com/api/activity_items.xml", "201")
  end
  let(:processor) { Github::Crisply::PayloadProcessor.new(payload) }

  context "When I sent valid json payload" do 
    subject { processor }
    its(:process) { should be_true }
  end
end
