class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_url(@comment)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(@comment)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_url(@comment)
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
