class User < ActiveRecord::Base
  has_many :posts
  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  before_save { self.name = name.downcase }
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


   def User.digest(string)
     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
     BCrypt::Password.create(string, cost: cost)
   end

   def User.new_token
     SecureRandom.urlsafe_base64
   end

   def remember
     self.remember_token = User.new_token
     update_attribute(:remember_digest, User.digest(remember_token))
   end

   def authenticated?(remember_token)
     return false if remember_digest.nil?
     BCrypt::Password.new(remember_digest).is_password?(remember_token)
   end

   # Forgets a user.
   def forget
     update_attribute(:remember_digest, nil)
   end
end
