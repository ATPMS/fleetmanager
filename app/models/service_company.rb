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
end
