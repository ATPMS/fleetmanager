class ServiceCompany < ActiveRecord::Base
  validates :name, presence: true
  validates :contact_number, presence: true
  validates :email, presence: true
  validates :contact_person, presence: true
  validates :address, presence: true

  belongs_to :user

  def to_s
    name
  end

  def pending_count
    VesselMaintenance.where(service_company_id: self.id, status: "pending").count
  end

  def pending_cost
    VesselMaintenance.where(service_company_id: self.id, status: "pending").sum(:cost)
  end

  def ongoing_count
    VesselMaintenance.where(service_company_id: self.id, status: "on-going").count
  end

  def ongoing_cost
    VesselMaintenance.where(service_company_id: self.id, status: "on-going").sum(:cost)
  end

  def done_count
    VesselMaintenance.where(service_company_id: self.id, status: "done").count
  end

  def done_cost
    VesselMaintenance.where(service_company_id: self.id, status: "done").sum(:cost)
  end

  def delayed_count
    VesselMaintenance.where("service_company_id = ? AND status = ? AND date_of_maintenance > ?", self.id, "pending", Time.now).count
  end

  def delayed_cost
    VesselMaintenance.where("service_company_id = ? AND status = ? AND date_of_maintenance > ?", self.id, "pending", Time.now).sum(:cost)
  end
end
