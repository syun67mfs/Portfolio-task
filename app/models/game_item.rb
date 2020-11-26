class GameItem < ApplicationRecord
  belongs_to :user
  belongs_to :genre, optional: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  attachment :image, destroy: false

  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end
end
