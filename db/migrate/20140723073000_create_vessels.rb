class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|
      t.integer :user_id
      t.string :name
      t.string :code
      t.string :reference_number
      t.string :access_token

      t.timestamps
    end
  end
end
