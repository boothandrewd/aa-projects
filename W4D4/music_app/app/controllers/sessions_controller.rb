class SessionsController < ApplicationController
  before_action :require_no_user!, only: [:create, :new]
  before_destroy :require_user!

  def new
    render :new
  end

  def create
    user_params = params.require(:user).values_at(:email, :password)
    @user = User.find_by_credentials(*user_params)
    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ['Incorrect email/password combination']
      redirect_to new_session_url
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end
end
