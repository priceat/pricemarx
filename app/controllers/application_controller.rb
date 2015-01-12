class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  before_action :authenticate!

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

   def pricemark_owner?
    Pricemark.where(user_id: current_user)
   end
 
  def authenticate!
    redirect_to login_url, alert: "Sign in first" if current_user.nil?
  end
end
