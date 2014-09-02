class AddAttachmentImageToVesselImages < ActiveRecord::Migration
  def self.up
    change_table :vessel_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :vessel_images, :image
  end
end
