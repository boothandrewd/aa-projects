class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def new
    render :new
  end

  def show
    render json: User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
