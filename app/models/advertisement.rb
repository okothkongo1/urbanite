  include ActionDispatch::TestProcess
class Advertisement < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  validates :location, presence: true, length: { maximum: 20 }
  validates :category, presence: true, length: { maximum: 20 }
  validates :advert_type, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { only_integer: true, allow_blank: true }
  validates :images, attached: true, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'],
             message: 'invalid image type', allow_blank: true },
             limit: { min: 3, max: 5, allow_blank: true,
             message: 'upload atleast 3 and at most 5 images' }

end
