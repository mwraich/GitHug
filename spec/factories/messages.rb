FactoryGirl.define do
<<<<<<< HEAD
  factory :message do
    recipient_id
    sender_id
    message
    subject_line
end
=======
 factory :message1 do
  #  recipient_id
  #  sender_id
   message {FFaker::Hacker.say_something_smart}
   subject_line {FFaker::Hacker.adjective }
   read_status {FFaker::Hacker.noun}
  end
>>>>>>> bd7f5bffcd7276445428024f7fc6e837f669238c
end
