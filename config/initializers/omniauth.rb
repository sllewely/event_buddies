require 'omniauth-facebook'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
    # scope: 'public_profile,email,user_birthday',
    # display: 'popup'
end
