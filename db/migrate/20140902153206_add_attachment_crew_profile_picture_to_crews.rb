class AddAttachmentCrewProfilePictureToCrews < ActiveRecord::Migration
  def self.up
    change_table :crews do |t|
      t.attachment :crew_profile_picture
    end
  end

  def self.down
    remove_attachment :crews, :crew_profile_picture
  end
end
