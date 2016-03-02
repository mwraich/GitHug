class Profile < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :first_name, :last_name, :location, :male, :female, :other, :birthday, :about_me
end
