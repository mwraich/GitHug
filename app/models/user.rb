class User < ActiveRecord::Base
  has_many :authentications
  authenticates_with_sorcery!

  def has_linked_with?(provider)
    authentication.where(provider: provider).present?
  end

end
