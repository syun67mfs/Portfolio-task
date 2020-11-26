class CommentsController < ApplicationController
  def create
    @game_item = GameItem.find(params[:game_item_id])
    @comment = @game_item.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to game_item_path(@game_item)
  end

  def destroy
    Comment.find_by(id: params[:id], game_item_id: params[:game_item_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
