require 'rails_helper'

RSpec.describe Twitter::ExtractTweetInfoService do
  let(:subject) { Twitter::ExtractTweetInfoService.new }
  let(:dm_url) { "https://api.twitter.com/1.1/statuses/show.json" }
  
  describe "#call" do
    let(:stubbed_auth_service) { instance_double(Twitter::AuthenticationService, call: true) }
    
    before do
      allow(stubbed_auth_service).to receive(:call).with(anything)
    end
    
    it "returns the tweet info" do
      # Very broken
      expect(stubbed_auth_service).to receive(:call)
      subject.call(1)
    end
  end
end