class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      render json: @comment
    else
      render @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render json: @comment
    else
      render @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    if params[:user_id]
      render json: User.find(params[:user_id]).comments
    elsif params[:artwork_id]
      render json: Artwork.find(params[:artwork_id]).comments
    else
      render json: Comment.all
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:artwork_id,:user_id,:body)
  end
end
