class SubsController < ApplicationController
  before_action :require_user!
  before_action :require_moderator!, only: [:update, :edit]

  def new
    @sub = Sub.new
  end

  def index
    @subs = Sub.all
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Subs.find_by(id: params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def require_moderator!
    redirect_to sub_url(params[:id]) unless current_user.subs.find_by(id: params[:id])
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
