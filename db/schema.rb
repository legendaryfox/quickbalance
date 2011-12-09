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

ActiveRecord::Schema.define(:version => 20111209144935) do

  create_table "accounts", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "debit_shorthand"
    t.string   "credit_shorthand"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pending_transactions", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "amount",           :precision => 8, :scale => 2
    t.text     "description"
    t.text     "long_description"
    t.string   "custom_credit"
    t.string   "custom_debit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shortcode"
    t.integer  "credited_id"
    t.integer  "debitted_id"
  end

  create_table "shortcode_parsers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "amount"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credited_id"
    t.integer  "debitted_id"
    t.string   "long_description"
    t.string   "custom_credit"
    t.string   "custom_debit"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
