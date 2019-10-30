class CreateCardsets < ActiveRecord::Migration
  def change
    create_table :cardsets do |t|
      t.string :name
      t.string :code
      t.string :short_name
      t.string :gathererCode
      t.string :old_code
      t.string :magic_cards_info_code
      t.string :releaseDate
      t.string :border
      t.string :type
      t.string :block
      t.string :onlineOnly
      t.string :booster
      t.string :mkm_id
      t.string :mkm_name
      t.string :type
      t.text :photo

      t.timestamps null: false
    end
  end
end
