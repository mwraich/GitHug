class User < ActiveRecord::Base

  has_many :authentications, dependent: :destroy
  has_one :profile, dependent: :destroy
  authenticates_with_sorcery!
  # accepts_nested_attributes_for :images


  def has_linked_with?(provider)
    authentication.where(provider: provider).present?
  end

  def notice
    profile.recipient_messages.where('read_status = false').count
  end


end
