class AddAccessTokenToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :access_token, :string
  end
end
