class Image < ActiveRecord::Base
  belongs_to :profiles
  mount_uploader :image, ImageUploader
end
