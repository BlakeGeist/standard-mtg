class AddAmountToPcards < ActiveRecord::Migration
  def change
    add_column :pcards, :amount, :integer
  end
end
