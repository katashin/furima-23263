class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      ActionCable.server.broadcast "comment_channel", content: @comment
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
