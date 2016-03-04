class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: :Profile
  belongs_to :sender, class_name: :Profile, :foreign_key => "profile_id"
end
