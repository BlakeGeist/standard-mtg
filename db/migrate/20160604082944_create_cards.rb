class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :info
      t.string :name
      t.string :layout
      t.text :manaCost
      t.integer :cmc
      t.string :cardType
      t.string :rarity
      t.text :text
      t.string :artist
      t.integer :number
      t.integer :power
      t.integer :toughness
      t.integer :multiverseid
      t.text :originalText
      t.text :flavor
      t.string :originalType
      t.string :setName
      t.string :set
      t.string :image_url
      t.string :supertypes
      t.string :subtypes
      t.string :types
      t.string :colors
      t.string :printings
      t.text :legalities
      t.text :rulings
      t.text :foreignNames

      t.timestamps null: false
    end
  end
end
