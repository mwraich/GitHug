class Conversation < ActiveRecord::Base
  has_many :messages
  has_many :recipient, class_name: :Profile, through: :messages, foreign_key: :sender_id
  has_many :sender, class_name: :Profile, through: :messages, foreign_key: :recipient_id

end
