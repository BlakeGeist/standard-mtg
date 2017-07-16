class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float :hiprice
      t.float :lowprice
      t.float :avgprice
      t.float :foilavgprice
      t.string :market

      t.timestamps null: false
    end
  end
end
