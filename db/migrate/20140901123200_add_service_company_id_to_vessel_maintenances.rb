class AddServiceCompanyIdToVesselMaintenances < ActiveRecord::Migration
  def change
    add_column :vessel_maintenances, :service_company_id, :integer
  end
end
