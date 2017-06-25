class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      session[:session_token] = @user.reset_token!
      redirect_to user_url(@user)
    else
      flash[:errors] = ["INVALID USERNAME OR PASSWORD PLEASE TRY AGAIN LOLOLAWLAWL"]
      redirect_to new_session_url
    end
  end

  def destroy
    session[:session_token] = nil
  end
end
