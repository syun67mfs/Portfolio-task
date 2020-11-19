class HomesController < ApplicationController

  def top
    if Genre.all.present? && GameItem.all.present?
      @genres = Genre.where(is_active: true)
      @game_item = GameItem.where(is_active: true)
      @game_items = @game_item.where(is_active: true).sample(4)
    end
  end

  def about

  end
end
