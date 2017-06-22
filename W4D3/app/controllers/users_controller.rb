class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    new_user = User.new(params[:user].permit(:username, :password))
    if new_user.save
      redirect_to "/users/#{new_user.id}"
    else
      # flash.now(new_user.errors.full_messages)
      redirect_to cats_url
    end
  end

  def show
    render json: User.find_by(id: params[:id])
  end
end
