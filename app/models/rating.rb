class Rating < ApplicationRecord

  validates :product_id, presence: true
  validates :users_id, presence: true
  validates :rating, presence: true

end
