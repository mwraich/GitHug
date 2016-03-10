FactoryGirl.define do
  factory :profile do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    location { FFaker::Address.city }
    birthday { FFaker::Time.date}
    about_me { FFaker::Lorem.phrase }
    male { FFaker::Boolean.random }
    female { FFaker::Boolean.random }
    other { FFaker::Boolean.random }
  end

  factory :profile1 do
    first_name { Joe }
    last_name { Bob }
    location { Toronto }
    birthday { 10/05/1990 }
    female { true }
    male { false }
    other { false }

  end
  factory :profile2, parent: :profile1 do
    female = false
    male = true
  end

  factory :profile3, parent: :profile1 do
    first_name = "Joan"
    last_name = "Potatoe"
  end

  factory :profil4, parent: :profile1 do

  end

  factory :profile5, parent: :profile1 do
  end

  factory :profile6, parent: :profile1 do
  end

  factory :profile7, parent: :profile1 do
  end

  factory :profile8, parent: :profile1 do
  end

  factory :profile9, parent: :profile1 do
  end

end
