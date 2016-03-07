class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: :Profile
  belongs_to :sender, class_name: :Profile


  # before_validation :find_id
  #
  # def find_id
  #   Profile.find_by(first_name: 'recipient').id
  # end



  def notifcation
    number_of_unread_messages = @profile.recipient_messages.where('read_status = false').count
  end

  # def read?
  #   if self.read
  #     @message.read_status = false
  #   end
  # end

end
