source 'https://rubygems.org'

# ruby '2.3.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Install jquery validation as javascript library
gem 'jquery-validation-rails', '~> 1.13', '>= 1.13.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#Added Gem
#for authentications
gem 'sorcery'
#to protect API keys
gem 'figaro'
#to allow search by location
gem 'geocoder'
#allows taging
gem 'acts-as-taggable-on', '~> 3.4'
#To be used for implementing privacy Settings



gem 'cloudinary'

#To enable text message notifications
gem 'twilio-ruby', '~> 4.11.1'
# To validiate phone numbers
gem 'phony_rails'

gem 'daemons'


gem 'bourbon'
gem 'neat'
gem 'autoprefixer-rails'


gem 'delayed_job_active_record'

gem 'typedJS'
gem 'bxslider-rails'


gem 'carrierwave'

gem 'mini_magick'

gem 'fog-aws'

gem 'cocoon'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
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
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'best_debugger'
  # gem 'pry-rails'
  # gem 'byebug'
  gem 'pry-rails'
  gem 'quiet_assets'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # added gems for development
  gem 'letter_opener'

  gem 'faker'
  end

  group :production do
    gem 'rails_12factor'
    # #
    # # # server
    gem 'puma'


end
