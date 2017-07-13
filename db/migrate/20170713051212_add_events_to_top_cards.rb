class AddEventsToTopCards < ActiveRecord::Migration
  def change
    add_column :top_cards, :events, :text
  end
end
