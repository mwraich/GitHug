class BlockedUser < ActiveRecord::Base
  belongs_to :user, foreign_key: :blocker_id
  belongs_to :enemy, class_name: User, foreign_key: :blocked_id
  # attr_accessible :blocker_id, :blocked_id
end
