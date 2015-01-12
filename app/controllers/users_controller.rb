class UsersController < ApplicationController
  skip_before_action :authenticate!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to pricemarks_path, notice: "Thank you for signing up!"
      else
        flash[:error] = "Invalid user information"
        redirect_to :back
      end
  end

   def edit
      @user = User.find(params[:id])
   end

   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to pricemarks_path
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_path
     end
   end
  
  def destroy
    @user = User.find(params[:id])
      if @user.destroy
        session.destroy
        redirect_to root_path, :notice => "Account Terminated."
      else
      flash[:error] = "There was an error deleting your account. Please contact support!"
      redirect_to edit_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end

end

