# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# # On command line type gem install faker, run bundle, and then rake db:seed

locations = ["Toronto,Ontario", "Montreal,Quebec", "Vancouver,BC", "Calgary,Alberta"]
languages = ["Ruby", "Javascript", "Ember.JS", "PHP", "C"]
10.times do |n|
  u = User.create!({
    username: Faker::Internet.domain_word,
    email: Faker::Internet.email,
    github_image: Faker::Avatar.image
  })
    # sleep(1)
  x = Profile.create!({
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    location:   locations.sample + ", " + "Canada",
    male:       true,
    female:     false,
    other:      false,
    birthday:   Faker::Date.backward(365*20),
    operating_system: Faker::App.version,
    about_me:   Faker::Hacker.say_something_smart,
    image:      Faker::Avatar.image,
    user: u
  })
end

100.times do |n|
  Language.create ({
    language: languages.sample,
    skill_level: Faker::Number.between(1, 5)
  })
end

100.times do |n|
  Preference.create ({
    location:   locations.sample + ", " + "Canada",
    male:       true,
    female:     false,
    other:      false,
    age:        Faker::Number.between(18, 75),
    operating_system: Faker::App.version,
    partner:    Faker::Boolean.boolean(0.5),
    paired_programmer: Faker::Boolean.boolean(0.5),
  })

end
