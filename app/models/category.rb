class Category < ActiveRecord::Base
  has_many :posts

  validates :title,
            presence: true,
            uniqueness: true
  validates :description,
            presence: true

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    end
  end
end
