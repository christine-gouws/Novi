class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :brand

  validates :rating, inclusion: { in: 0..10 }
end
