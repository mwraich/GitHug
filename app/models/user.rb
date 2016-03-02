class User < ActiveRecord::Base

  has_many :authentications
  has_many :images
  authenticates_with_sorcery!
  # accepts_nested_attributes_for :images

  accepts_nested_attributes_for :profile, :languages, :images

  def has_linked_with?(provider)
    authentication.where(provider: provider).present?
  end

end
