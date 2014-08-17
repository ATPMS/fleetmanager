class Vessel < ActiveRecord::Base
  belongs_to :user
  has_many :logs

  validates :name, presence: true
  validates :code, presence: true
  validates :reference_number, presence: true
  validates :access_token, presence: true, uniqueness: true

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
