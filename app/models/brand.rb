class Brand < ApplicationRecord
  has_many :ratings
  has_many :posts, as: :messageable
  has_many :followings, as: :followable
  has_many :products
  belongs_to :user
  has_one_attached :photo
end
