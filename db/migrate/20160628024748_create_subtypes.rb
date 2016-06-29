class CreateSubtypes < ActiveRecord::Migration
  def change
    create_table :subtypes do |t|
      t.string :name
      t.text :description
      t.string :title
      t.text :content
      t.text :url

      t.timestamps null: false
    end
  end
end
