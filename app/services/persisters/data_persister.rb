module Persisters
  class DataPersister
    
    attr_reader :type, :id
    
    def initialize(type, id)
      @type = type
      @id = id
    end
    
    def persist
      case type
      when 'podcast'
        pp = PodcastPersister.new(id, tweet_text)
      # when 'tv'
      #   TvPersister(tweet_text)
      # when 'netflix'
      #   NetflixPersister(tweet_text)
      
      else
        return
      end
      Tweet.new(origin_id: id, type: type, type_id: pp.id)
    end
    
    def tweet_text
      Twitter::ExtractTweetInfoService.new.call(id)
    end
  end
end