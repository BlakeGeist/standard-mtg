class AddLinkToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :link, :string
  end
end
