class Language < ActiveRecord::Base
  belongs_to :languageable, polymorphic: true
  belongs_to :profile
  belongs_to :partner
  belongs_to :pair_programmer

  # validates_presence_of :language, :skill_level

  # validates :language, uniqueness: {scope: [:languageable_id, :languageable_type]}


end
