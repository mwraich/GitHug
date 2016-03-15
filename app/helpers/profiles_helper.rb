module ProfilesHelper
  include ActsAsTaggableOn::TagsHelper

  def recos
    if profile.partnerReco.any?
    end
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
  
end
