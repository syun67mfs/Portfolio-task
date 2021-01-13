class GameItem < ApplicationRecord
  belongs_to :user
  belongs_to :genre, optional: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  attachment :image, destroy: false

  validates :name, presence: true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5
  }, presence: true
  validates :genre_id, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user).exists?
  end

  def favorited_by(user)
    favorites.where(user_id: user)
  end
end
