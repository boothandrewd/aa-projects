class CatsController < ApplicationController

  before_action :inspect_user, only: [:edit,:update]

  def inspect_user
    cat=Cat.find_by(id: params[:id])
    unless current_user.cats.include?(cat)
      redirect_to("/cats")
    end
  end

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    if current_user.nil?
      redirect_to(new_session_url)
      return
    end
    user_id = current_user.id
    @cat = Cat.new(cat_params)
    @cat.user_id=user_id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat)
      .permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
