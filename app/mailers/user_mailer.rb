class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to [GitHug <3]")
  end

  def user_message_notification(recipient, sender)
    @user = recipient
    @sender = sender
    mail(to: @user.user.email, subject: "You got a new message")
  end

end
