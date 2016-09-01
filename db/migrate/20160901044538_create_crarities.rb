class CreateCrarities < ActiveRecord::Migration
  def change
    create_table :crarities do |t|
      t.string :rarity

      t.timestamps null: false
    end
  end
end
