class RemoveServiceCompanyFromVesselMaintenances < ActiveRecord::Migration
  def change
    remove_column :vessel_maintenances, :service_company
  end
end
