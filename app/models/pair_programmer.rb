class PairProgrammer < ActiveRecord::Base
  has_many :languages, :as => :languageable
  belongs_to :profile

  def somemethod
    {
    'male' => self.male ? 1 : 0,
    'female' => self.female ? 1 : 0,
    'other' => self.other ? 1 : 0,
    'operating_system' => self.operating_system,
    'language' => self.languages.language,
    'min_age' => self.min_age,
    'max_age' => self.max_age,
    'location' => self.location
    }
  end
end
