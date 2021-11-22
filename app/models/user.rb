class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :brands
  has_many :followings
  has_many :ratings
  has_many :posts
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
