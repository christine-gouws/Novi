class Brand < ApplicationRecord
  has_many :ratings
  has_many :posts, as: :messageable
  has_many :followings, as: :followable
  belongs_to :user
end
