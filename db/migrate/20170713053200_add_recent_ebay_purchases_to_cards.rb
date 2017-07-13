class AddRecentEbayPurchasesToCards < ActiveRecord::Migration
  def change
    add_column :cards, :recent_ebay_purchases, :integer
  end
end
