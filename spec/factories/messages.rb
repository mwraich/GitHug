FactoryGirl.define do
  factory :message do
    recipient_id
    sender_id
    message
    subject_line
end
end
