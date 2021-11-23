class Post < ApplicationRecord
  belongs_to :messageable, polymorphic: true
  has_many :posts, as: :messageable

  belongs_to :user
  has_many :likes, dependent: :destroy
end
