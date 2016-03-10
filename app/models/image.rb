require 'file_size_validator'
class Image < ActiveRecord::Base
  belongs_to :profiles
  mount_uploader :image, ImageUploader
  validates :image,
  # :presence => true,
  :file_size => {
     :maximum => 0.5.megabytes.to_i
  }
end
