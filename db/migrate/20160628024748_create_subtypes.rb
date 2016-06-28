class CreateSubtypes < ActiveRecord::Migration
  def change
    create_table :subtypes do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
