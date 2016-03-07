require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_user_id_is_unique
    @profile = Profile.new(user_id: 2)
    assert_not @profile.save,"Profile saved without input"
  end
end
