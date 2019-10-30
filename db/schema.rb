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

ActiveRecord::Schema.define(version: 20171028115452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer  "edhrec_rank"
    t.integer  "collection_number"
    t.integer  "mtgo_id"
    t.integer  "arena_id"
    t.integer  "tcgplayer_id"
    t.integer  "cmc"
    t.integer  "multiverseid"
    t.integer  "multiverseid2"
    t.string   "name"
    t.string   "layout"
    t.string   "released_at_date"
    t.string   "uri"
    t.string   "scryfall_uri"
    t.string   "lang"
    t.string   "mana_cost"
    t.string   "type_line"
    t.string   "oracle_text"
    t.string   "colors"
    t.string   "games"
    t.string   "color_identity"
    t.string   "rarity"
    t.string   "artist"
    t.string   "rulings_uri"
    t.string   "set_uri"
    t.string   "scryfall_set_uri"
    t.string   "set_search_uri"
    t.string   "set_type"
    t.string   "set_name"
    t.string   "set"
    t.string   "frame"
    t.string   "prints_search_uri"
    t.string   "prices"
    t.string   "border_color"
    t.boolean  "foil"
    t.boolean  "nonfoil"
    t.boolean  "promo"
    t.boolean  "reprint"
    t.boolean  "variation"
    t.boolean  "digital"
    t.boolean  "reserved"
    t.boolean  "full_art"
    t.boolean  "textless"
    t.boolean  "booster"
    t.boolean  "story_spotlight"
    t.boolean  "oversized"
    t.text     "legalities"
    t.text     "rulings"
    t.text     "flavor_text"
    t.text     "images"
    t.integer  "cardset_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "slug"
    t.decimal  "avgprice"
    t.decimal  "hiprice"
    t.decimal  "lowprice"
    t.decimal  "foilprice"
    t.text     "link"
    t.integer  "recent_ebay_purchases"
    t.integer  "live_ebay_auctions"
    t.float    "price"
  end

  add_index "cards", ["slug"], name: "index_cards_on_slug", unique: true, using: :btree

  create_table "cardsets", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "short_name"
    t.string   "gathererCode"
    t.string   "old_code"
    t.string   "magic_cards_info_code"
    t.string   "releaseDate"
    t.string   "border"
    t.string   "type"
    t.string   "block"
    t.string   "onlineOnly"
    t.string   "booster"
    t.string   "mkm_id"
    t.string   "mkm_name"
    t.text     "photo"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "slug"
    t.boolean  "active"
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crarities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

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
    t.decimal  "price"
  end

  add_index "pcards", ["user_id"], name: "index_pcards_on_user_id", using: :btree

  create_table "prices", force: :cascade do |t|
    t.float    "hiprice"
    t.float    "lowprice"
    t.float    "avgprice"
    t.float    "foilavgprice"
    t.string   "market"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "link"
  end

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
    t.text     "link"
  end

  create_table "top50s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "top_cards", force: :cascade do |t|
    t.string   "name"
    t.integer  "count"
    t.integer  "top50_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "events"
    t.text     "card_list"
    t.float    "deck"
    t.float    "avg"
  end

  add_index "top_cards", ["top50_id"], name: "index_top_cards_on_top50_id", using: :btree

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
    t.string   "provider"
    t.string   "uid"
    t.string   "ebay_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cards", "cardsets"
  add_foreign_key "pcards", "users"
  add_foreign_key "tcg_prices", "cards"
  add_foreign_key "top_cards", "top50s"
end
