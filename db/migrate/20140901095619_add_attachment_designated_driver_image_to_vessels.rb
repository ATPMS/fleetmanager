class AddAttachmentDesignatedDriverImageToVessels < ActiveRecord::Migration
  def self.up
    change_table :vessels do |t|
      t.attachment :designated_driver_image
    end
  end

  def self.down
    remove_attachment :vessels, :designated_driver_image
  end
end
