module ProfilesHelper
  include ActsAsTaggableOn::TagsHelper


  def check_current_user
    current_user.profile == @profile
  end

  def show_gender(profile)

    if profile.male == true
      "Male"
    elsif profile.female == true
      "Female"
    else
      "Other"
     end
  end

  def provinces
    [
      ['Alberta'],
      ['British Columbia'],
      ['Manitoba'],
      ['New Brunswick'],
      ['Newfoundland and Labrador'],
      ['Northwest Territories'],
      ['Nova Scotia'],
      ['Nunavut'],
      ['Ontario'],
      ['Prince Edward Island'],
      ['Quebec'],
      ['Saskatchewan'],
      ['Yukon']
    ]
  end

end
