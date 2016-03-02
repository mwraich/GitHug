class ValidatesGender < ActiveModel::Validator
  def validate(profile)
    unless profile.male.present? || profile.female.present? || profile.other.present?
      profile.errors[:gender] << "can't be blank"
    end
  end
end

class Profile < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :first_name, :last_name, :location, :birthday, :about_me
  validates_with ValidatesGender


    #
    # validates :male, presence: true, unless: ->(profile){ profile.female.present?|| profile.other.present? }
    # validates :female, presence: true, unless: ->(profile){ profile.male.present? || profile.other.present? }
    # validates :other, presence: true, unless: ->(profile){ profile.male.present? || profile.female.present? }
    #


end
