require 'rails_helper'

RSpec.describe Twitter::ExtractDmsService do
  let(:subject) { Twitter::ExtractDmsService.new }
  let(:dm_url) { "https://api.twitter.com/1.1/direct_messages/events/list.json" }
  let(:tweet_id) { 1 }
  let(:type) { "podcast" }
  let(:dm_data) do
    { "events"=> ["something", "something"] }
  end

  before do
    allow_any_instance_of(Twitter::AuthenticationService).to receive(:call).with(anything).and_return(dm_data)
    allow_any_instance_of(Twitter::DmTweetData).to receive(:extract).and_return([tweet_id, type])
  end
  
  describe "#call" do
    context "when an error is returned from Twitter" do
      let(:error_data) { [["errors"]] }
      
      before do
        allow_any_instance_of(Twitter::AuthenticationService).to receive(:call).with(anything).and_return(error_data)
      end
      
      it "returns RATE LIMITED" do
        expect(subject.call).to eq("RATE LIMITED")
      end
    end
    
    context "when the correct data is returned" do
      context "when the tweet exists" do
        let!(:tweet) { create(:podcast, tweet_id: tweet_id) } 

        
        it "does not persist the tweet" do
          expect(Persisters::DataPersister).to_not receive(:new)
          subject.call
        end
      end
      
      context "when the tweet does not exist" do
        before do
          allow(Persisters::DataPersister).to receive_message_chain(:new, :persist)
        end
        
        it "does not persist the tweet" do
          expect(Persisters::DataPersister).to receive(:new)
          subject.call
        end
      end
    end
  end
end