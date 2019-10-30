class AddActiveToCardsets < ActiveRecord::Migration
  def change
    add_column :cardsets, :active, :boolean
  end
end
