class SessionsController < ApplicationController
  before_action :set_user
  
  def new
  end

  def create
      user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to pricemarks_path, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end

  private

  def set_user
    @current_user = User.find(params[:id])
  end