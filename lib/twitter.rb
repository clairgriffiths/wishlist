require 'twitter'
require 'json'
require 'date'
require 'pry'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end



favorites = client.direct_messages_sent
p favorites

