class BlockedUser < ActiveRecord::Base
  belongs_to :user, primary_key: :user_id, foreign_key: :id
  # attr_accessible :blocker_id, :blocked_id
end
