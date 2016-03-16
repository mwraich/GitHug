module ProfilesHelper
  include ActsAsTaggableOn::TagsHelper

  def authorize_pull_request(requestee_id)
    requestee_id.check_pull_request_permission(current_user)
  end
end
