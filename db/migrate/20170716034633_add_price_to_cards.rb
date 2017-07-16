class AddPriceToCards < ActiveRecord::Migration
  def change
    add_column :cards, :price, :float
  end
end
