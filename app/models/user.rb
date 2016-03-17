class User < ActiveRecord::Base

  has_many :authentications
  has_one :profile
  has_many :blocked_users, foreign_key: :blocker_id
  has_many :enemies, through: :blocked_users

  has_many :authentications, dependent: :destroy
  has_one :profile, dependent: :destroy
  authenticates_with_sorcery!
  

  def has_linked_with?(provider)
    authentication.where(provider: provider).present?
  end

  def notice
    profile.recipient_messages.where('read_status = false').count
  end

  def pull_request_notice
    profile.received_requests.where('read = true AND permission = true').count
  end
end
