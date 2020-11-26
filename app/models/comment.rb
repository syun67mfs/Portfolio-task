class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :game_item

  validates :comment, presence: true
end
