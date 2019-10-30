class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :edhrec_rank
      t.integer :collection_number
      t.integer :mtgo_id
      t.integer :arena_id
      t.integer :tcgplayer_id
      t.integer :cmc
      t.integer :multiverseid
      t.integer :multiverseid2
      t.string :name
      t.string :layout
      t.string :released_at_date
      t.string :uri
      t.string :scryfall_uri
      t.string :lang
      t.string :mana_cost
      t.string :type_line
      t.string :oracle_text
      t.string :colors
      t.string :games
      t.string :color_identity
      t.string :rarity
      t.string :artist
      t.string :rulings_uri
      t.string :set_uri
      t.string :scryfall_set_uri
      t.string :set_search_uri
      t.string :set_type
      t.string :set_name
      t.string :set
      t.string :frame
      t.string :prints_search_uri
      t.string :prices
      t.string :border_color
      t.boolean :foil
      t.boolean :nonfoil
      t.boolean :promo
      t.boolean :reprint
      t.boolean :variation
      t.boolean :digital
      t.boolean :reserved
      t.boolean :full_art
      t.boolean :textless
      t.boolean :booster
      t.boolean :story_spotlight
      t.boolean :oversized
      t.text :legalities
      t.text :rulings
      t.text :flavor_text
      t.text :images
      t.references :cardset, foreign_key: true

      t.timestamps null: false
    end
  end
end
