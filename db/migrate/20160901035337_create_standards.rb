class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :name
      t.string :short_name
      t.text :photo

      t.timestamps null: false
    end
  end
end
