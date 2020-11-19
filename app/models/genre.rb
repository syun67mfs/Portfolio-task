class Genre < ApplicationRecord
   has_many :game_items, dependent: :destroy
end
