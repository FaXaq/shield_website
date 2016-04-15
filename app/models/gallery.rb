class Gallery < ActiveRecord::Base
  belongs_to :category
  belongs_to :post

  validates :title,
            presence: true,
            length: { maximum: 50, minimum: 5 },
            uniqueness: { case_sensitive: false }

  validates :description,
            presence: true

  validates :post_id,
            presence: true

  validates :category_id,
            presence: true

  has_many :photos
  accepts_nested_attributes_for :photos, :allow_destroy => true

  def self.search(search)
    if search
      where('title ILIKE ?', "%#{search}%").reverse
    else
      last(5).reverse
    end
  end
end
