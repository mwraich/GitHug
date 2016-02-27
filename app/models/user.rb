class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :authentications
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
end
