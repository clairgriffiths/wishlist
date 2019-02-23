module Twitter  
  class ExtractDmsService
    
    require 'twitter/dm_tweet_data'
    
    DM_URL = "https://api.twitter.com/1.1/direct_messages/events/list.json"
    
    def call
      extract_data
    end
    
    private
    
    def extract_data
      if api_error
        return "RATE LIMITED"
      else
        dm_data["events"].each do |tweet|
          tweet_id, type = Twitter::DmTweetData.new(tweet).extract
          unless tweet_exists?(tweet_id, type)
            Persisters::DataPersister.new(tweet_id, type).persist
          end
        end
      end
    end
    
    def dm_data
      @dm_data ||= Twitter::AuthenticationService.new.call(DM_URL)
    end
    
    # How to deal with errors?
    
    def api_error
      dm_data.first.first == "errors"
    end

    def tweet_exists?(tweet_id, type)
      case type
      when "podcast"
        Podcast.exists?(tweet_id: tweet_id)
      else
        false
      end
    end
  end
end
