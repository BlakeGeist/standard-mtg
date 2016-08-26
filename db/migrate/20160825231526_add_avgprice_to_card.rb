class AddAvgpriceToCard < ActiveRecord::Migration
  def change
    add_column :cards, :avgprice, :decimal
    add_column :cards, :hiprice, :decimal
    add_column :cards, :lowprice, :decimal
    add_column :cards, :foilprice, :decimal
  end
end
