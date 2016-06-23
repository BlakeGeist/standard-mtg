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

ActiveRecord::Schema.define(version: 20160619201411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.text     "info"
    t.string   "name"
    t.string   "layout"
    t.text     "manaCost"
    t.string   "cmc"
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

end
