class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :game_item

  attachment :image, destroy: false
  attachment :profile_image, destroy: false

  validates :user_id, uniqueness: { scope: :game_item_id }
end
