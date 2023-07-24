source 'https://rubygems.org'
# git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.0.3'

gem 'acts_as_list', '~> 1.0.4'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.10.3', require: false

gem 'combine_pdf', "~> 1.0.22"

gem 'cloudinary', "~> 1.22.0"

gem 'devise', "~> 4.8.1"

gem 'devise_masquerade', "~> 1.3.9"

gem 'grover', "~> 1.1.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', "~> 7.0.2.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails", "~> 3.4.2"

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.3.3', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 4.3.11'

gem 'pundit', "~> 2.2.0"

gem 'rollbar', "~> 3.3.0"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0.0'

gem 'table_print', "~> 1.5.7"


# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails", "~> 1.0.3"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails", "~> 1.0.1"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails", "~> 1.0.4"

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails", "~> 2.0.7"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11.5'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.6.0'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'awesome_print', "~> 1.9.2"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', "~> 11.1.3", platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails', "~> 2.7.6"
  gem 'pry-byebug', "~> 3.9.0"
  gem 'pry-rails', "~> 0.3.9"
  gem 'rspec-rails', '~> 4.0.2'
end

group :development do
  gem 'annotate', "~> 3.2.0"
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # gem 'browser_sync_rails'
  gem 'listen', '~> 3.7.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', "~> 3.0.0"
  gem 'web-console', '~> 4.2.0'
end

group :test do
  gem 'capybara', '~> 3.36.0'
  gem 'database_cleaner', '~> 1.8.5'
  gem 'factory_bot_rails', "~> 6.2.0"
  gem 'faker', "~> 2.19.0"
  gem 'simplecov', '~> 0.18.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
