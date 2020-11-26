class AddNameToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :is_active, :boolean, default: true, null: false
  end
end
