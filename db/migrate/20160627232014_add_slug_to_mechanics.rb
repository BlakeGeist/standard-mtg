class AddSlugToMechanics < ActiveRecord::Migration
  def change
    add_column :mechanics, :slug, :string
    add_index :mechanics, :slug, unique: true
  end
end
