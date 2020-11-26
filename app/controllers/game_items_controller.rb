class GameItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update]
  # before_action :ensure_correct_game_item, only: [:edit,:update]

  def index
    @game_item = GameItem.new
    @genres = Genre.where(is_active: true)
    @genre = @genres.find_by(id: params[:search])
    unless @genre.nil?
      @game_items = GameItem.where(genre_id: @genre.id, is_active: true)
      @title = @genre.name
    else
      @game_items = GameItem.all
      @title = "ゲーム"
    end
  end

  def show
    @genres = Genre.where(is_active: true)
    @game_item = GameItem.find(params[:id])
    @comment = Comment.new
  end

  def new
    @game_item = GameItem.new
  end

  def create
    @game_item = GameItem.new(game_item_params)
    @game_item.user_id = current_user.id
    if @game_item.save
      redirect_to game_items_path
    end
  end

  def destroy
    @game_item = GameItem.find(params[:id])
    @game_item.destroy
    redirect_to game_items_path
  end

  def edit
     @game_item = GameItem.find(params[:id])
  end

  def update
    @game_item = GameItem.find(params[:id])
    if @game_item.update(game_item_params)
      redirect_to game_item_path
    end
  end



 private
  def game_item_params
    params.require(:game_item).permit(:name, :introduction, :price, :image, :genre_id, :is_active)
  end

  def ensure_correct_game_item
    @game_item = GameItem.find(params[:id])
    unless @game_item.user_id == current_user.id
      redirect_to game_items_path
    end
  end
end
