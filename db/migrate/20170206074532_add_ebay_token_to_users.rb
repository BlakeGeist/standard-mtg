class AddEbayTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ebay_token, :string
  end
end
