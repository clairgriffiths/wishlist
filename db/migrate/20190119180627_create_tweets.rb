class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets, primary_key: :original_tweet_id do |t|
      t.string :type
      t.integer :type_id
      t.timestamps
    end
  end
end
