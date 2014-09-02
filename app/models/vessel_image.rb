class VesselImage < ActiveRecord::Base
  belongs_to :vessel

  validates :title, presence: true

  has_attached_file :image,
    styles: { medium: "300x150",
              standard: "450x300"},
    default_url: "/assets/:attachment/missing_:style.png"
  validates_attachment_content_type :image, content_type: %w(image/jpg image/jpeg image/png), size: { in: 0..10000000.kilobytes }

  def to_s
    title
  end
end
