module Twitter  
  class DmTweetData
    
    attr_reader :tweet
    
    def initialize(tweet)
      @tweet = tweet
    end
    
    def extract
      return tweet_id, type
    end
    
    def tweet_id
      url = metadata["urls"].first["expanded_url"]
      url.split("/").last
    end
    
    def metadata
      tweet["message_create"]["message_data"]["entities"]
    end
    
    def type
      metadata["hashtags"].first["text"]
    end
  end
end