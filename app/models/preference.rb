class Preference < ActiveRecord::Base
  belongs_to :profile
  has_many :pref_languages

  accepts_nested_attributes_for :pref_languages
  # def self.recommended_profiles
    #in the controller create a new instance variable that will be a collection
    #of profiles returned by this method (in show method profiles controller)
    #convert itself into a hash to pass to search
    #needs to call Profile.search
  # end

  def preferences_recos
    pref_array = (Preference.all + PrefLanguage.all).to_a
    search(pref_array)
  end

end
