FactoryGirl.define do
    factory :user do
      email {FFaker::Internet.email}
      username {FFaker::Name.name}
      github_image {FFaker::Avatar.image}
    end

  
end
