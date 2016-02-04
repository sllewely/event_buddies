<<<<<<< 37c0bb968c828cfc9e6494ef24b5361c1aca0392
require 'omniauth-facebook'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
    scope: 'email, user_birthday, public_profile'
=======
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
>>>>>>> Ignore where I put my secret keys
end
