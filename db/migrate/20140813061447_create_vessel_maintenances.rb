class CreateVesselMaintenances < ActiveRecord::Migration
  def change
    create_table :vessel_maintenances do |t|
      t.integer :vessel_id
      t.date :date_of_maintenance
      t.string :maintenance_type
      t.string :status
      t.string :person_in_charge
      t.string :service_company
      t.decimal :cost

      t.timestamps
    end
  end
end
