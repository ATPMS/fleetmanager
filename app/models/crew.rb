class Crew < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :identification_number, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :contact_number, presence: true, uniqueness: true

  belongs_to :vessel
  validates :vessel, presence: true

  has_attached_file :crew_profile_picture,
    styles: { thumb: "80x800",
              standard: "150x150"},
    default_url: "/assets/:attachment/missing_:style.png"
  validates_attachment_content_type :crew_profile_picture, content_type: %w(image/jpg image/jpeg image/png), size: { in: 0..10000000.kilobytes }

  before_validation :load_defaults

  def to_s
    "#{first_name} #{last_name}"
  end

  def load_defaults
    if self.new_record?
      self.primary = false
    end
    true
  end
end
