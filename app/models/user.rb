class User < ActiveRecord::Base

  has_many :authentications
  has_one :profile
  authenticates_with_sorcery!
  # accepts_nested_attributes_for :images

  ROLES = %i[normal blocked]

  def roles= (roles)
    roles = [*roles].map { |r| r.to_sym }
  self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

  def has_linked_with?(provider)
    authentication.where(provider: provider).present?
  end

end
