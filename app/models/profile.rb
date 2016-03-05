class ValidatesGender < ActiveModel::Validator
  def validate(profile)
    unless profile.male.present? || profile.female.present? || profile.other.present?
      profile.errors[:gender] << "can't be blank"
    end
  end
end

class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :languages
  has_many :preferences
  has_many :images

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :languages, :preferences

  validates_presence_of :first_name, :last_name, :location, :birthday, :about_me
  validates_with ValidatesGender

  validates :user_id, uniqueness: {message: "Error. Looks like you already have a profile. You can update your profile by clicking on update."}
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  acts_as_taggable_on :tags


  def self.search(search_params)
    m = search_params['male'].to_i.positive?
    f = search_params['female'].to_i.positive?
    o = search_params['other'].to_i.positive?
    min_bday, max_bday = search_params['age'].split('-').map { |a| a.to_i.years.ago }

    near(search_params['location']).includes(:languages).where(
       male: m, female: f, other: o
    ).where('birthday BETWEEN ? AND ?', max_bday, min_bday
    ).where('languages.language = ? OR operating_system like ?', search_params['language'],search_params['operating_system']
    ).references(:languages)


  end

  def self.validate_gender
    unless profile.male.present? || profile.female.present? || profile.other.present?
      profile.errors[:gender] << "can't be blank"
    end
  end


end
