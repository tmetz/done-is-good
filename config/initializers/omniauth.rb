Rails.application.config.middleware.use OmniAuth::Builder do
    #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
    #provider :facebook, Rails.application.credentials[:facebook_key], Rails.application.credentials[:facebook_secret]
    provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET']

end