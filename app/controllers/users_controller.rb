class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
  @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tags_path, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

   def show
      @user = User.find(params[:id])
   end

   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to pricemarks_path
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end
  
  def destroy
    user = User.find(params[:id])
    
    user.destroy
    redirect_to root_path, :notice => "User deleted."
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end

end

