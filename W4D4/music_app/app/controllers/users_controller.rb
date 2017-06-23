class UsersController < ApplicationController
  before_action :require_no_user!, except: [:show]

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render text: @user.email
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
