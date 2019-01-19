module Twitter  
  class ExtractDmsService
    
    DM_URL = "https://api.twitter.com/1.1/direct_messages/events/list.json"
    
    def call
      data = retrieve_data
      persist_data(data)
    end
    
    private
    
    # How to deal with errors?
    
    def retrieve_data
      dm_data = Twitter::AuthenticationService.new.call(DM_URL)
      extract_data(dm_data)
    end

    def extract_data(dm_data)
      if dm_data.first.first == "errors"
        return "RATE LIMITED"
      else
        dm_data["events"].each do |tweet|
          metadata = extract_metadata(tweet)
          id = extract_id(metadata)
          unless tweet_exists?(id)
            type = extract_type(metadata)
            persist_data(type, id)
          end
        end
      end
    end
    
    def tweet_exists?(id)
      if Tweet.find(id)
        true
      else
        false
      end
    end
    
    def extract_metadata(tweet)
      tweet["message_create"]["message_data"]["entities"]
    end
    
    def extract_id(metadata)
      url = metadata["urls"].first["expanded_url"]
      url.split("/").last
    end
    
    def extract_type(metadata)
      unless metadata["hashtags"].empty?
        metadata["hashtags"].first["text"]
      end
    end
    
    def persist_data(type, id)
      Persisters::DataPersister.new(type, id).persist
    end
  end
end
