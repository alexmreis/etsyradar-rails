class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :radar_id
      t.integer :user_id
      t.text :message
      t.string :subject

      t.timestamps
    end
  end
end
