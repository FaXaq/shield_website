class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :post_part

  validates :title,
            presence: true,
            uniqueness: true
  validates :text,
            presence: true
  validates :category_id,
            presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"
                                     }, default_url: "https://source.unsplash.com/random"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates_attachment :avatar,
            size: { in: 0..10.megabytes },
            content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def self.search(search)
    if search
      where(published: true).where('title LIKE ?', "%#{search}%").reverse
    else
      where(published: true).last(5).reverse
    end
  end
end
