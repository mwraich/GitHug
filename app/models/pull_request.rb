class PullRequest < ActiveRecord::Base
  belongs_to :requestor, class_name: :Profile
  belongs_to :requestee, class_name: :Profile
  has_many :messages

  # sender asks receiver for permission to send message
  #if the permission is 'true' than the message button appears
  #if its not than the message button does not appear



end
