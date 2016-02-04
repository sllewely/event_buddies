source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Instead use postgres
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'react-rails'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Ruby-er view files
gem 'haml'
# Annotate models with schema info
gem 'annotate'
gem 'twitter-bootstrap-rails'

gem 'rake', '~> 10.5'

gem 'omniauth-facebook', '~> 3.0'
# Paperclip allows for user picture uploads and dynamic stuff. Uncomment if we want to use.
# gem 'paperclip'
# gem 'paperclip-meta'

# If we use AWS for anything (we will), uncomment this and use it.
# gem 'aws-sdk', '~> 2'

# Use this for secret keys if we plan to deploy on Heroku
# gem 'figaro'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem "rspec", "~> 3.1.0"
  gem "rspec-rails"
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :development do
  gem 'quiet_assets'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'rails_12factor'
end
