class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to GitHub")
  end

  def user_message_notification(recipient)
    @user = recipient
    mail(to: @user.user.email, subject: "You got a new message")
  end

end
