module ProfilesHelper
  include ActsAsTaggableOn::TagsHelper

  def show_gender(profile)

    if profile.male == true
      "Male"
    elsif profile.female == true
      "Female"
    else
      "Other"
     end
  end

end
