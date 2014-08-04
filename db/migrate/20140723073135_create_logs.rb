class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.decimal :lon, scale: 15, precision: 18
      t.decimal :lat, scale: 15, precision: 18
      t.datetime :logged_at
      t.string :session_token
      t.integer :vessel_id

      t.timestamps
    end
  end
end
