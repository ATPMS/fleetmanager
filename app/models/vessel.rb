class Vessel < ActiveRecord::Base
  belongs_to :user
  has_many :logs
  has_many :vessel_images
  accepts_nested_attributes_for :vessel_images, allow_destroy: true

  validates :name, presence: true
  validates :code, presence: true
  validates :reference_number, presence: true
  validates :access_token, presence: true, uniqueness: true

  has_many :crews
  accepts_nested_attributes_for :crews, allow_destroy: true

  has_attached_file :designated_driver_image,
    styles: { thumb: "80x800",
              standard: "150x150"},
    default_url: "/assets/:attachment/missing_:style.png"
  validates_attachment_content_type :designated_driver_image, content_type: %w(image/jpg image/jpeg image/png), size: { in: 0..10000000.kilobytes }

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

  def self.pending_count
    VesselMaintenance.where(status: "pending").count
  end

  def self.pending_cost
    VesselMaintenance.where(status: "pending").sum(:cost)
  end

  def self.ongoing_count
    VesselMaintenance.where(status: "on-going").count
  end

  def self.ongoing_cost
    VesselMaintenance.where(status: "on-going").sum(:cost)
  end

  def self.done_count
    VesselMaintenance.where(status: "done").count
  end

  def self.done_cost
    VesselMaintenance.where(status: "done").sum(:cost)
  end

  def self.delayed_count
    VesselMaintenance.where("status = ? AND date_of_maintenance < ?", "pending", Time.now).count
  end

  def self.delayed_cost
    VesselMaintenance.where("status = ? AND date_of_maintenance < ?", "pending", Time.now).sum(:cost)
  end

  def pending_count
    VesselMaintenance.where(vessel_id: self.id, status: "pending").count
  end

  def pending_cost
    VesselMaintenance.where(vessel_id: self.id, status: "pending").sum(:cost)
  end

  def ongoing_count
    VesselMaintenance.where(vessel_id: self.id, status: "on-going").count
  end

  def ongoing_cost
    VesselMaintenance.where(vessel_id: self.id, status: "on-going").sum(:cost)
  end

  def done_count
    VesselMaintenance.where(vessel_id: self.id, status: "done").count
  end

  def done_cost
    VesselMaintenance.where(vessel_id: self.id, status: "done").sum(:cost)
  end

  def delayed_count
    VesselMaintenance.where("vessel_id = ? AND status = ? AND date_of_maintenance < ?", self.id, "pending", Time.now).count
  end

  def delayed_cost
    VesselMaintenance.where("vessel_id = ? AND status = ? AND date_of_maintenance < ?", self.id, "pending", Time.now).sum(:cost)
  end

  def to_s
    name
  end

end
