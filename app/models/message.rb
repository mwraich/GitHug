class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: :Profile
  belongs_to :sender, class_name: :Profile
  # after_create :user_message_notification
  #
  def user_message_notification
    UserMailer.delay.user_message_notification
  end

end
