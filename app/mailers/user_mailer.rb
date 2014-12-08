class UserMailer < ApplicationMailer
   default from: 'priceat@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'https://pricemarx.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to pricemarx.')
  end
end