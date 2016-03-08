class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: :Profile
  belongs_to :sender, class_name: :Profile



  def notification
    where('read_status = false').count
  end


end
