class PullRequest < ActiveRecord::Base
  belongs_to :requestor, class_name: :Profile, foreign_key: :requestor_id
  belongs_to :requestee, class_name: :Profile,foreign_key: :requestee_id
  has_many :messages


end
