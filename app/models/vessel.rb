class Vessel < ActiveRecord::Base
  belongs_to :user
  has_many :logs

  validates :name, presence: true
  validates :code, presence: true
  validates :reference_number, presence: true
  validates :access_token, presence: true, uniqueness: true

  before_validation :load_defaults

  def load_defaults
    if self.new_record?
      self.access_token = SecureRandom.uuid
    end
  end

  def to_s
    name
  end

end
