class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :game_items, dependent: :destroy
  has_many :fav_posts, through: :favorites, source: :post
  attachment :profile_image, destroy: false

end
