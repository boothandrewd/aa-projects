class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @all_comments = @post.comments.includes(:author)
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post && @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to subs_url
  end

  def post_params
    params.require(:post).permit(:title, :sub, :url, :content)
  end
end
