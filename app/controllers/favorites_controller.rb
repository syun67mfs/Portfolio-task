class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @genres = Genre.where(is_active: true)
    @favorites = Favorite.where(user_id: current_user.id)
    @genre = @genres.find_by(id: params[:search])
    unless @genre.nil?
      @game_items = GameItem.where(genre_id: @genre.id, is_active: true)
      @title = @genre.name
    else
      @game_items = GameItem.all
      @title = "ゲーム"
    end

  end

  def create
    @game_item = GameItem.find(params[:game_item_id])
    @favorite = @game_item.favorites.new(user_id: current_user.id)
    if @favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @game_item = GameItem.find(params[:game_item_id])
    @favorite = @game_item.favorites.find_by(user_id: current_user.id)
    if @favorite.present?
        @favorite.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end

end
