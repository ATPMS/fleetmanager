class AddAttachmentImageToVessels < ActiveRecord::Migration
  def self.up
    change_table :vessels do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :vessels, :image
  end
end
