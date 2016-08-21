class CreateTcgPrices < ActiveRecord::Migration
  def change
    create_table :tcg_prices do |t|
      t.decimal :hiprice
      t.decimal :lowprice
      t.decimal :avgprice
      t.decimal :foilavgprice
      t.references :card, foreign_key: true

      t.timestamps null: false
    end
  end
end
