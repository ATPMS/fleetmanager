class CreateVesselImages < ActiveRecord::Migration
  def change
    create_table :vessel_images do |t|
      t.integer :vessel_id
      t.string :title

      t.timestamps
    end
  end
end
