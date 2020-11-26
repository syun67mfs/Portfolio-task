class AddIndexToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, :game_item_id
    add_index :favorites, :user_id
  end
end
