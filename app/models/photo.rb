class Photo < ActiveRecord::Base
  belongs_to :gallery

  has_attached_file :image, styles: { medium: '300x300>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates_attachment :image,
            size: { in: 0..10.megabytes },
            content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
