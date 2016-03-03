class Language < ActiveRecord::Base
  belongs_to :profile

  validates :language, uniqueness: {message: "Error. Looks like you've already added that language."}
  validates_presence_of :skill_level
end
