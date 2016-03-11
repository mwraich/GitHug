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
  has_many :pref_language
  has_many :images
  has_many :sent_messages, class_name: :Message, foreign_key: :sender_id
  has_many :recipient_messages, class_name: :Message, foreign_key: :recipient_id
  has_many :blocked_users, through: :users
  has_many :enemies, through: :blocked_users, class_name: User


  accepts_nested_attributes_for :images, :languages, :preferences, allow_destroy: true


  validates_presence_of :first_name, :last_name, :location, :birthday, :about_me
  # validates_with ValidatesGender
  validates :user_id, uniqueness: {message: "Error. Looks like you already have a profile. You can update your profile by clicking on update."}
  geocoded_by :city, :location
  after_validation :geocode, if: :location_changed?
  acts_as_taggable_on :tags

  def self.search(search_params)
    m = search_params['male'].to_i.positive?
    f = search_params['female'].to_i.positive?
    o = search_params['other'].to_i.positive?
    min_age = search_params['min_age'].to_i.years.ago
    max_age = (search_params['max_age'].to_i + 1).years.ago

    near(search_params['location']).includes(:languages).where(
       male: m, female: f, other: o
  ).where('birthday BETWEEN ? AND ?', min_age, max_age
    ).where('languages.language = ? OR operating_system like ?', search_params['language'],search_params['operating_system']
    ).references(:languages)
  end

  def self.validate_gender
    unless profile.male.present? || profile.female.present? || profile.other.present?
      profile.errors[:gender] << "can't be blank"
    end
  end

  def blocked_by?(current_user)
    current_user.enemies.include?(self.user) #Have you blocked this person?
  end

end
