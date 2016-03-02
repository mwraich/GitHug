# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do |n|
  User.create({
    username: Faker::Internet.domain_word,
    email: Faker::Internet.email,
    github_image: Faker::Avatar.image
  })
end

100.times do |n|
  Profile.create ({
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    location:   Faker::Address.city,
    male:       Faker::Boolean.boolean(0.5),
    female:     Faker::Boolean.boolean(0.5),
    other:      Faker::Boolean.boolean(0.5),
    birthday:   Faker::Date.backward(5000),
    operating_system: Faker::App.version,
    about_me:   Faker::Hacker.say_something_smart
  })
end

100.times do |n|
  Language.create ({
    language: Faker::Hacker.noun,
    skill_level: Faker::Number.between(1, 5)
  })
end

100.times do |n|
  Preference.create ({
    location:   Faker::Address.city,
    male:       Faker::Boolean.boolean(0.5),
    female:     Faker::Boolean.boolean(0.5),
    other:      Faker::Boolean.boolean(0.5),
    birthday:   Faker::Date.backward(5000),
    operating_system: Faker::App.version,
    partner:    Faker::Boolean.boolean(0.5),
    paired_programmer: Faker::Boolean.boolean(0.5),
    about_me:   Faker::Hacker.say_something_smart
  })
end
