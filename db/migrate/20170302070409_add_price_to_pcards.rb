class AddPriceToPcards < ActiveRecord::Migration
  def change
    add_column :pcards, :price, :decimal
  end
end
