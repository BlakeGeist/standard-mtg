class FixColumnName < ActiveRecord::Migration

  def change
    rename_column :crarities, :rarity, :name
    rename_column :colors, :color, :name
  end
end
