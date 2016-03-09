class PrefLanguage < ActiveRecord::Base
  has_one :preference
  has_one :profile, through :preference
end
