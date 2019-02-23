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
        PodcastPersister.new(id, tweet_text).persist_data
      when 'tv'
        TvProgrammePersister(id, tweet_text).persist_data
      when 'radio'
        RadioProgrammePersister(id, tweet_text).persist_data
      # when 'netflix'
      #   NetflixPersister(tweet_text)
      else
        return
      end
    end
    
    def tweet_text
      Twitter::ExtractTweetInfoService.new.call(id)
    end
  end
end