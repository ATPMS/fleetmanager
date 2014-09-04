class AddPrimaryToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :primary, :boolean, null: false, default: false
  end
end
