# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100128032316) do

  create_table "messages", :force => true do |t|
    t.text     "message"
    t.string   "question"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "difficulty"
    t.string   "recipient_email_address"
    t.string   "answer2"
    t.string   "answer3"
    t.string   "answer4"
    t.string   "answer5"
    t.string   "answer6"
    t.string   "answer7"
    t.string   "hint1"
    t.string   "hint2"
    t.string   "hint3"
    t.string   "short_url"
    t.string   "email_from_name"
    t.text     "email_from_message"
    t.integer  "attempts"
    t.boolean  "receipt_notification"
    t.string   "receipt_notification_email"
    t.boolean  "receipt_notification_sent"
  end

  create_table "popup_ads", :force => true do |t|
    t.integer  "cpl"
    t.string   "call_to_action"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
