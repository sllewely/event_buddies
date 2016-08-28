require 'omniauth-facebook'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
    scope: 'email, user_birthday, public_profile',
    display: 'popup'
end
