class CreateTopCards < ActiveRecord::Migration
  def change
    create_table :top_cards do |t|
      t.string :name
      t.integer :count
      t.references :top50, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
