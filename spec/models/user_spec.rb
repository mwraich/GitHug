require 'rails_helper'

describe User, type: :model do
  let(:user) { User.new email: "1@2.com" }
  let(:profile) { FactoryGirl.create(:profile, :user => user) }
  let(:message1) {FactoryGirl.create(:message1, :recipient_id => profile.id)}

  it 'check' do
    message = Message.create(recipient: profile)
    message2 = Message.create(recipient: profile, read_status: true)
    byebug

    expect(user.notice).to eq(565)
  end

  it 'fails' do
    expect(message1).to be nil
    expect(true).to be false
  end
end
