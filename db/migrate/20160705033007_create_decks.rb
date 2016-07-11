class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
