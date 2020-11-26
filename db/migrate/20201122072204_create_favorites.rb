class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :image_id
      t.integer :user_id
      t.integer :game_item_id
      t.text :introduction

      t.timestamps
    end
  end
end
