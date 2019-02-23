FactoryBot.define do
  factory :podcast do
    tweet_id { 1 }
    full_text { "This is the body of the tweet text" }
    user_name  { "user_1" }
    user_screen_name { "user_1_screen_name" }
  end
end

