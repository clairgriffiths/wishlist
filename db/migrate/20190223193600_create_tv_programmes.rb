class CreateTvProgrammes < ActiveRecord::Migration[5.0]
  def change
    create_table :tv_programmes do |t|
      t.integer :tweet_id
      t.string :full_text
      t.string :user_name
      t.string :user_screen_name
      t.timestamps
    end
  end
end
