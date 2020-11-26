class HomesController < ApplicationController

  def top
    # if Genre.all.present? && GameItem.all.present?
      @genres = Genre.where(is_active: true)
      @game_item = GameItem.where(is_active: true)
      @game_items = @game_item.where(is_active: true).sample(4)
      @game_item_new = GameItem.limit(4).order(" created_at DESC ")
    # end
  end

  def about

  end
end
