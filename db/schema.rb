# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140320213143) do

  create_table "friendships", :force => true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  add_index "friendships", ["friend_id"], :name => "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"

  create_table "goals", :force => true do |t|
    t.string   "title",                      :null => false
    t.text     "description"
    t.integer  "bet_amount",  :default => 0
    t.datetime "start_date",                 :null => false
    t.datetime "end_date",                   :null => false
    t.integer  "buddy_id"
    t.integer  "user_id"
  end

  add_index "goals", ["buddy_id"], :name => "index_goals_on_buddy_id"
  add_index "goals", ["user_id"], :name => "index_goals_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.string   "name",            :null => false
    t.text     "bio"
    t.string   "picture"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
