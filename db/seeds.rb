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
    user: u1
  })

  Language.create!({
    language: "Ruby",
    skill_level: 1,
    profile: x1
  })

  Language.create!({
    language: "JavaScript",
    skill_level: 2,
    profile: x1
  })

  z1 = Preference.create!({
    city:       "Toronto",
    province:   "Ontario",
    male:       false,
    female:     false,
    other:      true,
    min_age:    28,
    max_age:   35,
    operating_system: "OS X",
    partner:    true,
    paired_programmer: false,
    profile: x1
  })

  PrefLanguage.create!({
    pref_lang: "JavaScript",
    skill_level: 2,
    preference: z1
  })

  PrefLanguage.create!({
    pref_lang: "Ruby",
    skill_level: 1,
    preference: z1
  })

  u2 = User.create!({
    username: "joepotato",
    email: "joe@gmail.com",
    github_image: Faker::Avatar.image
  })

x2 = Profile.create!({
  first_name: "Joe",
  last_name:  "Potato",
  city:       "Toronto",
  province:   "Ontario",
  male:       true,
  female:     false,
  other:      false,
  birthday:   "1980-04-15",
  operating_system: "Ubuntu",
  about_me:   Faker::Hacker.say_something_smart,
  image:      Faker::Avatar.image,
  user: u2
  })

Language.create!({
  language: "Java",
  skill_level: 5,
  profile: x2
})

Language.create!({
  language: "C",
  skill_level: 5,
  profile: x2
})

Language.create!({
  language: "JavaScript",
  skill_level: 5,
  profile: x2
})

z2 = Preference.create!({
  city:       "Toronto",
  province:   "Ontario",
  male:       false,
  female:     false,
  other:      true,
  min_age:    30,
  max_age:   40,
  operating_system: "Ubuntu",
  partner:    true,
  paired_programmer: false,
  profile: x2
})

Language.create!({
  language: "Java",
  skill_level: 3,
  profile: x2
})

Language.create!({
  language: "C",
  skill_level: 3,
  profile: x2
})

Language.create!({
  language: "JavaScript",
  skill_level: 3,
  profile: x2
})

  z1 = Preference.create!({
    city:       "Toronto",
    province:   "Ontario",
    male:       false,
    female:     false,
    other:      true,
    min_age:    28,
    max_age:   35,
    operating_system: "OS X",
    partner:    true,
    paired_programmer: false,
    profile: x2
  })

    PrefLanguage.create!({
    pref_lang: "JavaScript",
    skill_level: 2,
    preference: z2
    })

    PrefLanguage.create!({
    pref_lang: "Ruby",
    skill_level: 1,
    preference: z2
    })


5.times do |n|
  u = User.create!({
    username: Faker::Internet.domain_word,
    email: Faker::Internet.email,
    github_image: Faker::Avatar.image
  })
  x = Profile.create!({
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    city:   city.sample,
    province:   province.sample,
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
    profile: x
  })
  end

  z = Preference.create!({
    city:   city.sample,
    province:   province.sample,
    male:       Faker::Boolean.boolean,
    female:     Faker::Boolean.boolean,
    other:      Faker::Boolean.boolean,
    min_age:    Faker::Number.between(18),
    max_age:   Faker::Number.between(75),
    operating_system: operating_system.sample,
    partner:    Faker::Boolean.boolean(0.5),
    paired_programmer: Faker::Boolean.boolean(0.5),
    profile: x
  })

  2.times do |n|
    PrefLanguage.create!({
    pref_lang: languages.sample,
    skill_level: Faker::Number.between(1, 5),
    preference: z
    })
  end
end

5.times do |n|
  u = User.create!({
    username: Faker::Internet.domain_word,
    email: Faker::Internet.email,
    github_image: Faker::Avatar.image
  })
  x = Profile.create!({
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    city:   city.sample,
    province:   province.sample,
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
    profile: x
  })
  end

  z = Preference.create!({
    city:   city.sample,
    province:   province.sample,
    male:       Faker::Boolean.boolean,
    female:     Faker::Boolean.boolean,
    other:      Faker::Boolean.boolean,
    min_age:    Faker::Number.between(18),
    max_age:   Faker::Number.between(75),
    operating_system: operating_system.sample,
    partner:    Faker::Boolean.boolean(0.5),
    paired_programmer: Faker::Boolean.boolean(0.5),
    profile: x
  })

  2.times do |n|
    PrefLanguage.create!({
    pref_lang: languages.sample,
    skill_level: Faker::Number.between(1, 5),
    preference: z
    })
  end
end
