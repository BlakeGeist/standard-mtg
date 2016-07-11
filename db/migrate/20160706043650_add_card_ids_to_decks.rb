class AddCardIdsToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :card_ids, :text
  end
end
