class Preference < ActiveRecord::Base
  belongs_to :profile
  has_many :pref_languages

  accepts_nested_attributes_for :pref_languages

  after_create :to_hash
  # def self.recommended_profiles
    #in the controller create a new instance variable that will be a collection
    #of profiles returned by this method (in show method profiles controller)
    #convert itself into a hash to pass to search
    #needs to call Profile.search
  # end

  def to_hash
    {
    'male' => self.male ? 1 : 0,
    'female' => self.female ? 1 : 0,
    'other' => self.other ? 1 : 0,
    'operating_system' => self.operating_system,
    'pref_languages' => self.pref_languages.first.pref_lang,
    'min_age' => self.min_age,
    'max_age' => self.max_age,
    'location' => self.location
    }
  end

  def self.pref_search(to_hash)
    m = ['male']
    f = ['female']
    o = ['other']
    min_age = ['min_age']
    max_age = ['max_age']

    where(['location']).includes(:pref_languages).where(
       male: m, female: f, other: o
  ).where('birthday BETWEEN ? AND ?', max_age, min_age
    ).where('pref_languages.pref_lang = ? OR operating_system like ?', ['pref_language'], ['operating_system']
    ).references(:languages)
  end


end
