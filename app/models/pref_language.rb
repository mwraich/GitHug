class PrefLanguage < ActiveRecord::Base
  belongs_to :preference
  has_one :profile, through: :preference
end
