class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_part

  validates :title,
            presence: true
  validates :text,
            presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"
                                     }, default_url: "https://source.unsplash.com/random"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates_attachment :avatar,
            size: { in: 0..10.megabytes },
            content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
