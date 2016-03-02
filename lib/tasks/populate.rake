# namespace :db do
#   desc "Erase and fill database"
#   task :populate => :environment do
#     require 'populator'
#     require 'faker'
#
#     [User, Profile, Language, Preferences].each(&:delete_all)
#
#     User.populate 20 do |user|
#       user.email = Faker::Internet.email
#       user.username =
#       user.github_image =
#     end
#
#     Profile.populate
#   end
# end
