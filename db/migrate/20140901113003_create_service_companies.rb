class CreateServiceCompanies < ActiveRecord::Migration
  def change
    create_table :service_companies do |t|
      t.integer :user_id
      t.string :name
      t.string :contact_number
      t.string :email
      t.text :notes
      t.string :contact_person

      t.timestamps
    end
  end
end
