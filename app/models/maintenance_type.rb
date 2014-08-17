class MaintenanceType < ActiveRecord::Base
  validates :name, presence: true
  validates :code, presence: true

  has_many :vessel_maintenances

  def to_s
    name
  end
end
