class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    #session=Session.new
    credentials = params[:user].values_at(:username, :password)
    user = User.find_by_credentials(*credentials)
    if user
      @session_token = user.reset_session_token!
      session[:session_token] = @session_token
      redirect_to "/users/#{user.id}"
    else
      redirect_to cats_url
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    redirect_to new_user_url
  end
end
