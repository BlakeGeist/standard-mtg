class AddLinkToCards < ActiveRecord::Migration
  def change
    add_column :cards, :link, :text
  end
end
