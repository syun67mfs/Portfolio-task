class AddNameToGameItems < ActiveRecord::Migration[5.2]
  def change
    add_column :game_items, :name, :string
    add_column :game_items, :image_id, :string
    add_column :game_items, :introduction, :text
    add_column :game_items, :price, :integer
    add_column :game_items, :genre_id, :integer
    add_column :game_items, :user_id, :integer
    add_column :game_items, :is_active, :boolean, default: false
    add_column :game_items, :rate, :float, null:false, default: 0
  end
end
