class AddSlugToCardsets < ActiveRecord::Migration
  def change
    add_column :cardsets, :slug, :string
  end
end
