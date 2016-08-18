class CreatePcards < ActiveRecord::Migration
  def change
    create_table :pcards do |t|
      t.integer :card_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
