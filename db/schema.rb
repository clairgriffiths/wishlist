# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190223194922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "netflix_shows", force: :cascade do |t|
    t.integer  "tweet_id"
    t.string   "full_text"
    t.string   "user_name"
    t.string   "user_screen_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "podcasts", force: :cascade do |t|
    t.integer  "tweet_id"
    t.string   "full_text"
    t.string   "user_name"
    t.string   "user_screen_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "radio_programmes", force: :cascade do |t|
    t.integer  "tweet_id"
    t.string   "full_text"
    t.string   "user_name"
    t.string   "user_screen_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "tv_programmes", force: :cascade do |t|
    t.integer  "tweet_id"
    t.string   "full_text"
    t.string   "user_name"
    t.string   "user_screen_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "tweets", primary_key: "original_tweet_id", force: :cascade do |t|
    t.string   "type"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
