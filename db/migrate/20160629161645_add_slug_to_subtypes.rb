class AddSlugToSubtypes < ActiveRecord::Migration
  def change
    add_column :subtypes, :slug, :string
    add_index :subtypes, :slug, unique: true
  end
end
