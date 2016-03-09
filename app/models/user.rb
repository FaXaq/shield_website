class User < ActiveRecord::Base
  has_many :posts

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,
            presence: true,
            length: { maximum: 50 },
            uniqueness: { case_sensitive: false }
  validates :firstname,
            presence: true,
            length: { maximum: 50 }
  validates :lastname,
            presence: true,
            length: { maximum: 50 }
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password,
            presence: true,
            length: { minimum: 6 }

  has_secure_password

  has_attached_file :avatar,
                    styles: {
                      medium: "300x300>",
                      thumb: "100x100>" },
                    default_url: ":style/user/missing_user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates_attachment :avatar,
            size: { in: 0..4.megabytes },
            content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
