class Partner < ActiveRecord::Base
  belongs_to :profile
  has_many :languages, :as => :languageable

  accepts_nested_attributes_for :languages, allow_destroy: true

  before_create :location, :latitude  => :latitude, :longitude => :lon
  before_update :location, :latitude  => :lat, :longitude => :lon

  geocoded_by :location
  after_validation :geocode, if: :location_changed?



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
    'city' => self.city,
    'province' => self.province
    }
  end

  def location_changed?
    city_changed? || province_changed?
  end



end
