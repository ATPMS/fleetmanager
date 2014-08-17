class AddMaintenanceTypeIdToVesselMaintenances < ActiveRecord::Migration
  def change
    remove_column :vessel_maintenances, :maintenance_type
    add_column :vessel_maintenances, :maintenance_type_id, :integer
  end
end
