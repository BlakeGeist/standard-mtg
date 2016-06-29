class AddSlugToSubtypes < ActiveRecord::Migration
  def change
    add_column :subtypes, :slug, :string
  end
end
