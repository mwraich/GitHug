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
  mount_uploader :image, ImageUploader
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :languages, :preferences

  validates_presence_of :first_name, :last_name, :location, :birthday, :about_me
  validates_with ValidatesGender

  # def self.validate_gender
  #   unless profile.male.present? || profile.female.present? || profile.other.present?
  #     profile.errors[:gender] << "can't be blank"
  #   end
  # end

end
