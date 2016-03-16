  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# # On command line type gem install faker, run bundle, and then rake db:seed


province = ["Ontario"]
city = ["Toronto", "Ottawa", "London", "Waterloo", "Hamilton"]
languages = ["Ruby", "Javascript", "PHP", "C", "Java"]
operating_system = ["Linux", "OS X", "Windows", "Ubuntu"]

  u1 = User.create!({
    username: "emsmith",
    email: "em@gmail.com",
    github_image: Faker::Avatar.image
  })

  x1 = Profile.create!({
    first_name: "Emily",
    last_name:  "Smith",
    city:       "Toronto",
    province:   "Ontario",
    male:       false,
    female:     true,
    other:      false,
    birthday:   "1985-03-27",
    operating_system: "OS X",
    about_me:   Faker::Hacker.say_something_smart,
    image:      Faker::Avatar.image,
    date:    true,
    paired_programmer: true,
    user: u1
  })


  Language.create!({
    language: "Ruby",
    skill_level: 1,
    languageable_id: x1.id,
    languageable_type: Profile
  })

  Language.create!({
    language: "JavaScript",
    skill_level: 2,
    languageable_id: x1.id,
    languageable_type: Profile
  })

  z1 = Partner.create!({
    city:       city.sample,
    province:   province.sample,
    male:       false,
    female:     false,
    other:      true,
    min_age:    28,
    max_age:   35,
    operating_system: "OS X",
    profile: x1
  })


  Language.create!({
    language: "JavaScript",
    skill_level: 2,
    languageable_id: x1.id,
    languageable_type: Profile
  })

  Language.create!({
    language: "JavaScript",
    skill_level: 2,
    languageable_id: x1.id,
    languageable_type: Profile
  })

  u1 = User.create!({
    username: "joeypotato",
    email: "joe@potato.com",
    github_image: Faker::Avatar.image
  })

  x1 = Profile.create!({
    first_name: "Joe",
    last_name:  "Potato",
    city:       "Toronto",
    province:   "Ontario",
    male:       true,
    female:     false,
    other:      false,
    birthday:   "1980-01-24",
    operating_system: "Ubuntu",
    about_me:   Faker::Hacker.say_something_smart,
    image:      Faker::Avatar.image,
    date:        true,
    paired_programmer: false,
    user: u1
  })


  Language.create!({
    language: "Ruby",
    skill_level: 1,
    languageable_id: x1.id,
    languageable_type: Profile
  })

  Language.create!({
    language: "JavaScript",
    skill_level: 2,
    languageable_id: x1.id,
    languageable_type: Profile
  })

  z1 = Partner.create!({
    city:       city.sample,
    province:   province.sample,
    male:       false,
    female:     false,
    other:      true,
    min_age:    28,
    max_age:   35,
    operating_system: "OS X",
    profile: x1
  })


  Language.create!({
    language: "JavaScript",
    skill_level: 2,
    languageable_id: x1.id,
    languageable_type: Profile
  })

  Language.create!({
    language: "JavaScript",
    skill_level: 2,
    languageable_id: x1.id,
    languageable_type: Profile
  })

5.times do |n|
  u = User.create!({
    username: Faker::Internet.domain_word,
    email: Faker::Internet.email,
    github_image: Faker::Avatar.image
  })

   sleep(1)

  x = Profile.create!({
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    city:   city.sample,
    province:   province.sample,
    male:       false,
    female:     true,
    date:       false,
    paired_programmer: true,
    birthday:   Faker::Date.backward(365*20),
    operating_system: operating_system.sample,
    about_me:   Faker::Hacker.say_something_smart,
    image:      Faker::Avatar.image,
    user: u

  })

  Language.create!({
    language: languages.sample,
    skill_level: Faker::Number.between(1, 5),
    languageable_id: x.id,
    languageable_type: PairProgrammer
  })

  z = PairProgrammer.create!({
    city:       city.sample,
    province:   province.sample,
    male:       Faker::Boolean.boolean,
    female:     Faker::Boolean.boolean,
    other:      Faker::Boolean.boolean,
    min_age:    Faker::Number.between(18),
    max_age:   Faker::Number.between(75),
    operating_system: operating_system.sample,
    profile: x
  })

  2.times do |n|
    Language.create!({
      language: languages.sample,
      skill_level: Faker::Number.between(1, 5),
      languageable_id: z.id,
      languageable_type: PairProgrammer
    })
  end
end


5.times do |n|
  u = User.create!({
    username: Faker::Internet.domain_word,
    email: Faker::Internet.email,
    github_image: Faker::Avatar.image
  })

  sleep(1)

  x = Profile.create!({
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    city:       city.sample,
    province:   province.sample,
    date:        true,
    paired_programmer: false,
    male:       false,
    female:     true,
    other:      false,
    birthday:   Faker::Date.backward(365*20),
    operating_system: operating_system.sample,
    about_me:   Faker::Hacker.say_something_smart,
    image:      Faker::Avatar.image,
    user: u
  })

  2.times do |n|
    Language.create!({
      language: languages.sample,
      skill_level: Faker::Number.between(1, 5),
      languageable_id: x.id,
      languageable_type: Profile
  })
  end

  z = Partner.create!({
    city:       city.sample,
    province:   province.sample,
    male:       Faker::Boolean.boolean,
    female:     Faker::Boolean.boolean,
    other:      Faker::Boolean.boolean,
    min_age:    Faker::Number.between(18),
    max_age:   Faker::Number.between(75),
    operating_system: operating_system.sample,
    profile: x
  })


  2.times do |n|
    Language.create!({
      language: languages.sample,
      skill_level: Faker::Number.between(1, 5),
      languageable_id: x.id,
      languageable_type: Profile
  })
  end
end
