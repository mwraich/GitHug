class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to GitHub")
  end

  def user_connection_email(recipient, sender, subject)
    @user = recipient
    mail(to: sender.email, subject: subject)
  end

end
