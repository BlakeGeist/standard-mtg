class CreateMechanics < ActiveRecord::Migration
  def change
    create_table :mechanics do |t|
      t.string :name
      t.string :title
      t.text :description
      t.text :url
      t.text :content

      t.timestamps null: false
    end
  end
end
