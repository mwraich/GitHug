class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: :Profile
  belongs_to :sender, class_name: :Profile

  before_validation :check_id_not_nill, only: [:creates]

  def check_id_not_nill
  :recipient_id
  end

end
