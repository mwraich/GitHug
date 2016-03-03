class Profile < ActiveRecord::Base
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: => :address_changes?
  acts_as_taggable
  acts_as_taggable_on 

end
