source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.5'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# ログイン機能
gem 'devise'

# 日本語化
gem 'devise-i18n'
gem 'rails-i18n', '~> 5.1'

# Bootstrap
gem 'bootstrap', '~> 4.5'
gem 'jquery-rails'

gem 'cocoon'
gem 'font-awesome-sass', '~> 5.13'
gem 'kaminari', '~> 1.2.1'
gem 'refile', require: 'refile/rails', github: 'manfe/refile'
gem 'refile-mini_magick'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'dotenv-rails'
group :production do
  gem 'mysql2'
end

gem 'listen', '>= 3.0.5', '< 3.2'
