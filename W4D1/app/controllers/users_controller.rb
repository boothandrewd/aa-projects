class UsersController < ApplicationController
  def index

    # @users = User.all
    # @results = params[:user_id] ? User.find(params[:user_id]).artworks : User.all
    # render json: @users
    query_params = request.query_parameters
    if query_params && query_params[:username]
      #search
      user = User.find_by(username: query_params[:username])
      if user
        render json: user
      else
        render user.errors.full_messages, status: :unprocessable_entity
      end
    else
      render json: User.all
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: user
    else
      render user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
