class VesselMaintenance < ActiveRecord::Base
  MAINTENANCE_STATUSES = ["pending", "done", "on-going"]
  validates :date_of_maintenance, presence: true
  validates :status, presence: true
  validates :person_in_charge, presence: true
  validates :service_company, presence: true
  validates :cost, presence: true

  belongs_to :vessel
  validates :vessel, presence: true

  belongs_to :maintenance_type
  validates :maintenance_type, presence: true

  belongs_to :service_company

  def self.user_vessel_maintenances(u)
    VesselMaintenance.joins(:vessel).where("user_id = ?", u.id).order("vessel_maintenances.date_of_maintenance DESC")
  end
end
