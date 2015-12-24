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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151216093312) do

  create_table "addresses", force: :cascade do |t|
    t.string   "country",          limit: 255
    t.string   "city",             limit: 255
    t.string   "street",           limit: 255
    t.integer  "house_number",     limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "address_kind",     limit: 255
    t.string   "zip_code",         limit: 255
    t.integer  "addressable_id",   limit: 4
    t.string   "addressable_type", limit: 255
  end

  add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "house_phone",   limit: 255
    t.string   "email",         limit: 255
    t.string   "avatar",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "mobile_phone",  limit: 255
    t.date     "date_of_birth"
    t.integer  "user_id",       limit: 4
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "friend_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true, using: :btree

  create_table "overs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.text     "house_phone",            limit: 65535
    t.text     "mobile_phone",           limit: 65535
    t.text     "avatar",                 limit: 65535
    t.date     "date_of_birth"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
