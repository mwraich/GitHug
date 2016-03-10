class User < ActiveRecord::Base

  has_many :authentications
  has_one :profile
  has_many :blocked_users, foreign_key: :blocker_id
  has_many :enemies, through: :blocked_users

  has_many :authentications, dependent: :destroy
  has_one :profile, dependent: :destroy
  authenticates_with_sorcery!
  # accepts_nested_attributes_for :images

  # ROLES = %i[normal]
  #
  # def roles= (roles)
  #   roles = [*roles].map { |r| r.to_sym }
  # self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  # end
  #
  # def roles
  #   ROLES.reject do |r|
  #     ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
  #   end
  # end
  # 
  # def has_role?(role)
  #   roles.include?(role)
  # end

  def has_linked_with?(provider)
    authentication.where(provider: provider).present?
  end

  def notice
    profile.recipient_messages.where('read_status = false').count
  end


end
