class Conversation < ActiveRecord::Base
  has_many :messages
  has_one :conversation_recipient, class_name: :Profile, through: :messages, foreign_key: :sender_id
  has_one :conversation_sender, class_name: :Profile, through: :messages, foreign_key: :recipient_id

  accepts_nested_attributes_for :messages

end
