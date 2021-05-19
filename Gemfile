# frozen_string_literal: true
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0', '>= 6.0.3.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'simple_form', '~> 5.0', '>= 5.0.2'
gem 'devise-security', '~> 0.14.3'
gem 'valid_email2', '~> 3.2', '>= 3.2.2'
gem 'administrate', '~> 0.13.0'
gem 'active_storage_validations', '~> 0.8.9'
gem 'mini_magick', '~> 4.10', '>= 4.10.1'
gem 'figaro', '~> 1.2'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# gem 'rubocop', '~> 0.39.0', require: false
# gem 'rubocop-rails', '~> 2.4', '>= 2.4.2'
# gem 'rubocop-rspec'
# gem 'rubocop-performance'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry', '~> 0.13.1'
  gem 'pry-byebug', '~> 3.9'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'shoulda-matchers', '~> 4.3'
  gem 'database_cleaner', '~> 1.8', '>= 1.8.5'
  gem 'factory_bot_rails', '~> 5.2'
  gem 'rubocop', '~> 0.84.0', require: false
  gem 'rubocop-rails', '~> 2.5', '>= 2.5.2', require: false
  gem 'rubocop-rspec', '~> 1.39', require: false
  gem 'rubocop-performance', '~> 1.6', require: false
  gem 'capybara', '~> 3.32', '>= 3.32.2'
  # This gem helps Capybara interact with the web browser.
  gem 'webdriver', '~> 0.8.0'
  gem 'simplecov', '~> 0.18.5', require: false
  gem 'faker', '~> 2.11'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console'
  # anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors', '~> 2.7', '>= 2.7.1'
  gem 'binding_of_caller', '~> 0.8.0'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
