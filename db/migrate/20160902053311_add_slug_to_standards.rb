class AddSlugToStandards < ActiveRecord::Migration
  def change
    add_column :standards, :slug, :string
  end
end
