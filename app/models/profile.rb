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



  accepts_nested_attributes_for :images, :languages, :preferences, allow_destroy: true


  validates_presence_of :first_name, :last_name, :location, :birthday, :about_me
  validates_with ValidatesGender


  def self.search
    where("language like ?", "%{search}")
    where("age like ?", "%{search}")
    where("gender like ?", "%{search}")
    where("operating_system like ?", "%{search}")
  end

  # def self.validate_gender
  #   unless profile.male.present? || profile.female.present? || profile.other.present?
  #     profile.errors[:gender] << "can't be blank"
  #   end
  # end

  validates :user_id, uniqueness: {message: "Error. Looks like you already have a profile. You can update your profile by clicking on update."}


end
