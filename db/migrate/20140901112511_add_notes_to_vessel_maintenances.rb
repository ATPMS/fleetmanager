class AddNotesToVesselMaintenances < ActiveRecord::Migration
  def change
    add_column :vessel_maintenances, :notes, :text
  end
end
