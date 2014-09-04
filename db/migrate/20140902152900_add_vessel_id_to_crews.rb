class AddVesselIdToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :vessel_id, :integer
  end
end
