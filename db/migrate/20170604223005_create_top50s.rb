class CreateTop50s < ActiveRecord::Migration
  def change
    create_table :top50s do |t|

      t.timestamps null: false
    end
  end
end
