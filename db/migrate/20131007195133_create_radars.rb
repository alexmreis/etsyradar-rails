class CreateRadars < ActiveRecord::Migration
  def change
    create_table :radars do |t|
      t.integer :shop_id
      t.integer :user_id
      t.string :filter, :default => '.*'
      t.datetime :last_update
      t.text :last_items

      t.timestamps
    end
  end

end
