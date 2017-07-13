class AddDeckToTopCard < ActiveRecord::Migration
  def change
    add_column :top_cards, :deck, :float
    add_column :top_cards, :avg, :float
  end
end
