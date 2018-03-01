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

ActiveRecord::Schema.define(version: 20180301162535) do

  create_table "comments", force: :cascade do |t|
    t.string   "bdy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "post_id"
    t.string   "mbs"
    t.string   "kod"
    t.string   "oran"
    t.string   "durum"
    t.integer  "user_id"
    t.float    "product"
    t.string   "mac"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "iceriks", force: :cascade do |t|
    t.string   "mbs"
    t.string   "saat"
    t.string   "lig"
    t.string   "kod"
    t.string   "mac"
    t.string   "oran1"
    t.string   "oran2"
    t.string   "oran3"
    t.string   "oran4"
    t.string   "oran5"
    t.string   "oran6"
    t.string   "oran7"
    t.string   "oran8"
    t.string   "oran9"
    t.string   "oran10"
    t.string   "oran11"
    t.string   "oran12"
    t.string   "oran13"
    t.string   "oran14"
    t.string   "oran15"
    t.string   "oran16"
    t.string   "oran17"
    t.string   "oran18"
    t.string   "oran19"
    t.string   "oran20"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tarih"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "onay"
    t.float    "bakiye"
    t.float    "sum"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "bakiye"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
