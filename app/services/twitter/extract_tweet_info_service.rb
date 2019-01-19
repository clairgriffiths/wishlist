module Twitter
  class ExtractTweetInfoService
    
    TWEET_URL = "https://api.twitter.com/1.1/statuses/show.json"
    
    def call(id)
      extract_tweet_text(id)
    end
    
    private
    
    def extract_tweet_text(id)
      tweet = fetch_tweet(id)
      tweet["full_text"]
    end
    
    def fetch_tweet(id)
      full_url = TWEET_URL + "?tweet_mode=extended&id=#{id}&include_entities=true"
      Twitter::AuthenticationService.new.call(full_url)
    end
  end
end