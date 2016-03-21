
Rails.application.config.sorcery.submodules = [:external]

Rails.application.config.sorcery.configure do |config|
  config.external_providers = [:github]
  config.github.key = ENV["github_client_id"]
  config.github.secret = ENV["github_secret"]
  config.github.callback_url = ENV["https://murmuring-dawn-50947.herokuapp.com/oauth/callback?provider=github"]
  config.github.scope = "user" #gives full access to users public page
  config.github.user_info_mapping = {:email => "email", :username => "name", :github_image => "avatar_url"} #:your_data => :providers_data

  config.user_config do |user|
    user.username_attribute_names = :first_name
    user.authentications_class = Authentication
  end

  config.user_class = "User"
end
