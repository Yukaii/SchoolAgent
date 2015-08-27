source 'https://rubygems.org'

ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', :groups => [:development, :test]
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
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem "rails-i18n"

gem 'slim-rails'

gem 'devise', '~> 3.4.0'
gem 'omniauth-colorgy-oauth2'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
gem 'sidekiq'
gem 'clockwork'

# Model factory and tools
gem 'factory_girl_rails'
gem 'faker'

# Loads environment variables from `.env`
gem 'dotenv-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'pry-rails'
gem 'awesome_print', :require => false
gem 'hirb', :require => false
gem 'hirb-unicode', :require => false

# agent needed
gem 'httpclient'
gem 'rtesseract', require: false
gem 'nokogiri', require: false
gem 'iconv', require: false
gem 'rmagick', require: false

gem 'rename'

gem 'thin'
gem "rack-timeout"

group :development do
  gem 'better_errors', '~> 2.0.0'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'meta_request'
  gem 'letter_opener'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  gem 'shoulda'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', '~> 0.9.1', require: false

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'kaminari'
gem 'bootstrap-kaminari-views'

gem 'simple_form', '~> 3.1.0'

gem 'bootstrap-sass', '~> 3.3.4'
