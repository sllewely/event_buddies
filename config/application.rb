require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ConcertBuddies
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators.javascript_engine = :js
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # config.react.addons = false
    config.autoload_paths += Dir["#{config.root}/app/controllers/**/"]

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
