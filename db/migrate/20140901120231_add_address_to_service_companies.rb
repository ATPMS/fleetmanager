class AddAddressToServiceCompanies < ActiveRecord::Migration
  def change
    add_column :service_companies, :address, :text
  end
end
