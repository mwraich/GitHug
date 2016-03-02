class User < ActiveRecord::Base
  has_many :authentications
  has_one :profile
  has_many :languages
  has_many :preferences
  authenticates_with_sorcery!

  def has_linked_with?(provider)
    authentication.where(provider: provider).present?
  end

end
