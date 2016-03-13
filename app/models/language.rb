class Language < ActiveRecord::Base
  belongs_to :languable, :polymorphic => true

  # validates :language, uniqueness: {scope: :profile_id}
  validates_presence_of :skill_level


end
