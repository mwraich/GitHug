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


  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :languages, :preferences

  validates_presence_of :first_name, :last_name, :location, :birthday, :about_me
  validates_with ValidatesGender
  validates :user_id, uniqueness: {message: "Error. Looks like you already have a profile. You can update your profile by clicking on update."}

end
