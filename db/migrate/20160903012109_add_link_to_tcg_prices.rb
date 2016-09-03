class AddLinkToTcgPrices < ActiveRecord::Migration
  def change
    add_column :tcg_prices, :link, :text
  end
end
