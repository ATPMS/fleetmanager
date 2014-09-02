class AddDriverFirstNameAndDriverLastNameAndDriverContactNumberAndDriverAddressToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :driver_first_name, :string
    add_column :vessels, :driver_last_name, :string
    add_column :vessels, :driver_contact_number, :string
    add_column :vessels, :driver_address, :text
  end
end
