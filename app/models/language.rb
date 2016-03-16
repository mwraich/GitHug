class Language < ActiveRecord::Base
  belongs_to :profile

  # validates :language, uniqueness: {scope: :profile_id}
  validates_presence_of :skill_level


end
