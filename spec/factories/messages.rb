FactoryGirl.define do
 factory :message1 do
  #  recipient_id
  #  sender_id
   message {FFaker::Hacker.say_something_smart}
   subject_line {FFaker::Hacker.adjective }
   read_status {FFaker::Hacker.noun}
  end
end
