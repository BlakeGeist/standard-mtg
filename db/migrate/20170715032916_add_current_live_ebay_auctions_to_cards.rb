class AddCurrentLiveEbayAuctionsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :live_ebay_auctions, :integer
  end
end
