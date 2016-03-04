class ValidatesGender < ActiveModel::Validator
  def validate(profile)
    unless profile.male.present? || profile.female.present? || profile.other.present?
      profile.errors[:gender] << "can't be blank"
    end
  end
end

class Profile < ActiveRecord::Base
  belongs_to :user

  geocoded_by :address
  # after_validation :geocode, if: => :address_changes?
  # acts_as_taggable
  acts_as_taggable_on :tags

  has_many :languages
  has_many :preferences
  has_many :images
  has_many :messages

  accepts_nested_attributes_for :images, :languages, :preferences, allow_destroy: true


  validates_presence_of :first_name, :last_name, :location, :birthday, :about_me
  validates_with ValidatesGender


  def self.search(search_params)
    m = search_params['male'].to_i.positive?
    f = search_params['female'].to_i.positive?
    o = search_params['other'].to_i.positive?
    min_age,max_age = search_params['age'].split('-')

    includes(:languages).where(
       age: min_age..max_age, male: m, female: f, other: o
       ).where('languages.language = ? OR operating_system like ?',search_params['language'],search_params['operating_system']
    ).references(:languages)
  end

  # def self.validate_gender
  #   unless profile.male.present? || profile.female.present? || profile.other.present?
  #     profile.errors[:gender] << "can't be blank"
  #   end
  # end

  validates :user_id, uniqueness: {message: "Error. Looks like you already have a profile. You can update your profile by clicking on update."}


end
