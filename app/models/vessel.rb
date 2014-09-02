class Vessel < ActiveRecord::Base
  belongs_to :user
  has_many :logs
  has_many :vessel_images
  accepts_nested_attributes_for :vessel_images, allow_destroy: true

  validates :name, presence: true
  validates :code, presence: true
  validates :reference_number, presence: true
  validates :access_token, presence: true, uniqueness: true

  has_attached_file :designated_driver_image,
    styles: { thumb: "80x800",
              standard: "150x150"},
    default_url: "/assets/:attachment/missing_:style.png"
  validates_attachment_content_type :designated_driver_image, content_type: %w(image/jpg image/jpeg image/png), size: { in: 0..10000000.kilobytes }

  #validates :driver_first_name, presence: true
  #validates :driver_last_name, presence: true

  before_validation :load_defaults

  has_many :vessel_maintenances
  accepts_nested_attributes_for :vessel_maintenances, allow_destroy: true

  def self.user_vessels(u)
    Vessel.where(user_id: u.id)
  end

  def load_defaults
    if self.new_record?
      self.access_token = SecureRandom.uuid
    end
  end

  def to_s
    name
  end

end
