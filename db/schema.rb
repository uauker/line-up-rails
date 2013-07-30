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

ActiveRecord::Schema.define(:version => 20130730230810) do

  create_table "users", :force => true do |t|
    t.date     "event_date"
    t.integer  "facebook_user_id"
    t.string   "facebook_name"
    t.datetime "created_at"
    t.string   "facebook_username"
  end

  add_index "users", ["event_date", "facebook_user_id"], :name => "index_users_on_event_date_and_facebook_user_id", :unique => true
  add_index "users", ["event_date"], :name => "index_users_on_event_date"
  add_index "users", ["facebook_user_id"], :name => "index_users_on_facebook_user_id"

end
