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

ActiveRecord::Schema.define(version: 20160821155023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.text     "info"
    t.string   "name"
    t.string   "layout"
    t.string   "mana_cost"
    t.integer  "cmc"
    t.string   "cardType"
    t.string   "rarity"
    t.text     "text"
    t.string   "artist"
    t.integer  "number"
    t.integer  "power"
    t.integer  "toughness"
    t.integer  "multiverseid"
    t.text     "originalText"
    t.text     "flavor"
    t.string   "originalType"
    t.string   "setName"
    t.string   "set"
    t.string   "image_url"
    t.string   "supertypes"
    t.string   "subtypes"
    t.string   "types"
    t.string   "colors"
    t.string   "printings"
    t.text     "legalities"
    t.text     "rulings"
    t.text     "foreignNames"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
  end

  add_index "cards", ["slug"], name: "index_cards_on_slug", unique: true, using: :btree

  create_table "mechanics", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.text     "url"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  add_index "mechanics", ["slug"], name: "index_mechanics_on_slug", unique: true, using: :btree

  create_table "pcards", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "amount"
  end

  add_index "pcards", ["user_id"], name: "index_pcards_on_user_id", using: :btree

  create_table "subtypes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "title"
    t.text     "content"
    t.text     "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  add_index "subtypes", ["slug"], name: "index_subtypes_on_slug", unique: true, using: :btree

  create_table "tcg_prices", force: :cascade do |t|
    t.decimal  "hiprice"
    t.decimal  "lowprice"
    t.decimal  "avgprice"
    t.decimal  "foilavgprice"
    t.integer  "card_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "pcards", "users"
  add_foreign_key "tcg_prices", "cards"
end
