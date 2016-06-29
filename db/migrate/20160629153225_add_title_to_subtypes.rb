class AddTitleToSubtypes < ActiveRecord::Migration
  def change
    add_column :subtypes, :title, :string
    add_column :subtypes, :content, :text
    add_column :subtypes, :url, :text
  end
end
