class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: :Profile
  belongs_to :sender, class_name: :Profile

  def send_text_message
  # number_to_send_to = profile.phone

  twilio_sid: ENV["twilio_sid"]
  twilio_token: ENV["twilio_token"]
  twilio_phone_number: ENV["twilio_phone_number"]

  @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

  @twilio_client.account.sms.messages.create(
    :from => "+1#{twilio_phone_number}",
    :to => profile.phone_number,
    :body => message
  )
  end
end
