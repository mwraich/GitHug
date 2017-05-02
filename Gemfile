source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '4.2.5.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0' # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'jquery-validation-rails', '~> 1.13', '>= 1.13.1' # Install jquery validation as javascript library
gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc', '~> 0.4.0', group: :doc # bundle exec rake doc:rails generates the API under doc/api.

#Added Gem
gem 'sorcery' #for authentications
gem 'figaro' #to protect API keys
gem 'geocoder' #to allow search by location
gem 'acts-as-taggable-on', '~> 3.4' #allows taging
gem 'cloudinary' #To be used for implementing privacy Settings
gem 'twilio-ruby', '~> 4.11.1' #To enable text message notifications
gem 'phony_rails' # To validiate phone numbers
gem 'daemons'
gem 'bourbon'
gem 'neat'
gem 'autoprefixer-rails'
gem 'delayed_job_active_record'
gem 'typedJS' #githug typing on hp
gem 'bxslider-rails' #profile photos
gem 'carrierwave' #image attachments
gem 'mini_magick'
gem 'fog-aws'
gem 'cocoon'

group :test do
  gem 'rspec-rails', ' ~> 3.0'
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'guard-rspec', require: false
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false

end
group :development, :test do
  gem 'best_debugger'
  # gem 'pry-rails'
  # gem 'byebug'
  gem 'pry-rails'
  gem 'quiet_assets'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'letter_opener'
  gem 'faker'
  end

  group :production do
    gem 'rails_12factor'
    gem 'puma'
end
