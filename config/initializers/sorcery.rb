
Rails.application.config.sorcery.submodules = [:external]

Rails.application.config.sorcery.configure do |config|
  config.external_providers=[:github]
  config.github.key = Figaro.env.github_client_id
  config.github.secret = Figaro.env.github_secret
  config.github.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=github"
  config.github.scope = "user" #gives full access to users public page
  config.github.user_info_mapping = {:email => "email", :first_name => "name"} #:your_data => :providers_data

  config.user_config do |user|
    user.username_attribute_names = :first_name


    user.authentications_class = Authentication
  end

  config.user_class = "User"
end
