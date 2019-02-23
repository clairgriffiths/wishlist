module Persisters
  class BookPersister
    
    attr_reader :id, :tweet_text
    
    def initialize(id, tweet_text)
      @id = id
      @tweet_text = tweet_text
    end
    
    def persist_data
      Book.create(
        tweet_id: id,
        full_text: full_text,
        user_name: user_name,
        user_screen_name: user_screen_name
        )
    end
    
    def full_text
      tweet_text["full_text"]
    end
    
    def user_name
      tweet_text["user"]["name"]
    end
    
    def user_screen_name
      tweet_text["user"]["screen_name"]
    end
  end
end
