class CreateCrews < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_number
      t.text :address
      t.string :email
      t.string :identification_number

      t.timestamps
    end
  end
end
