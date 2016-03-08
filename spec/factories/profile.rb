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


end
