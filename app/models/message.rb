class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: :Profile
  belongs_to :sender, class_name: :Profile

  before_validation :check_id_not_nill, only: [:creates]
  before_create :read_status_true

  def check_id_not_nill
    :recipient_id
  end

  def read_status_true
    self.read_status = true
  end

  def notifcation
    number_of_un_read_messages = @profile.recipient_messages.where(read_status == false).count
  end

  # def read?
  #   if self.read
  #     @message.read_status = false
  #   end
  # end

end
