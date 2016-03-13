class Language < ActiveRecord::Base
  belongs_to :languable, :polymorphic => true
  belongs_to :profile
  belongs_to :partner
  belongs_to :pair_programmer

  # validates :language, uniqueness: {scope: :profile_id}
  validates_presence_of :skill_level


end
