class Tweet < ApplicationRecord
  self.primary_key = 'original_tweet_id'
end
