class Gallery < ActiveRecord::Base
  belongs_to :category
  belongs_to :post

  has_many :photos
end
