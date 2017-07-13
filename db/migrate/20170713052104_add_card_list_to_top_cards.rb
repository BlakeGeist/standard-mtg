class AddCardListToTopCards < ActiveRecord::Migration
  def change
    add_column :top_cards, :card_list, :text
  end
end
