class AddActiveToStandards < ActiveRecord::Migration
  def change
    add_column :standards, :active, :boolean
  end
end
