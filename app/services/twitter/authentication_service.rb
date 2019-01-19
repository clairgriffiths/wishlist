module Twitter  
  class AuthenticationService
    
    TWITTER_OAUTH_TOKEN = ENV["TWITTER_OUATH_TOKEN"]
    TWITTER_OAUTH_TOKEN_SECRET = ENV["TWITTER_OAUTH_TOKEN_SECRET"]
    TWITTER_API_KEY = ENV["TWITTER_API_KEY"]
    TWITTER_API_SECRET = ENV["TWITTER_API_SECRET"]

    def call(url)
      retrieve_tweets(url)
    end
    
    def retrieve_tweets(url)
      access_token = prepare_access_token(TWITTER_OAUTH_TOKEN, TWITTER_OAUTH_TOKEN_SECRET)
      response = access_token.request(:get, url)
      JSON.parse(response.body)
    end
  
    def prepare_access_token(oauth_token, oauth_token_secret)
      consumer = OAuth::Consumer.new(TWITTER_API_KEY, TWITTER_API_SECRET, { :site => "https://api.twitter.com", :scheme => :header })
      token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
      access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
      
      return access_token
    end
    
  end
end