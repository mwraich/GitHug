class Partner < ActiveRecord::Base
  belongs_to :profile
  has_many :languages, :as => :languageable

  accepts_nested_attributes_for :languages, allow_destroy: true

  # validates_presence_of :languages

  # def self.recommended_profiles
    #in the controller create a new instance variable that will be a collection
    #of profiles returned by this method (in show method profiles controller)
    #convert itself into a hash to pass to search
    #needs to call Profile.search
  # end



  def tohash
    {
    'date' => 1 ,
    'paired_programmer' => 0,
    'male' => self.male ? 1 : 0,
    'female' => self.female ? 1 : 0,
    'other' => self.other ? 1 : 0,
    'operating_system' => self.operating_system,
    'language' => self.languages.to_a,
    'min_age' => self.min_age,
    'max_age' => self.max_age,
    'location' => self.location
    }
  end


end
