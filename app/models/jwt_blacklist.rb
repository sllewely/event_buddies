class JWTBlacklist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Blacklist
end
