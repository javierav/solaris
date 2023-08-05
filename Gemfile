source "https://rubygems.org"

## RUBY
ruby "3.2.2"

## RAILS
gem "rails", github: "rails/rails", branch: "main"

## DATABASE
gem "sqlite3"

## SERVER
gem "puma"

## ASSETS
gem "importmap-rails"
gem "propshaft"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"

## LIBRARIES
gem "bootsnap", require: false
gem "http"
gem "huawei_solar"

group :development do
  gem "amazing_print"
  gem "better_errors"
  gem "dotenv-rails"
  gem "error_highlight"
  gem "rubocop", require: false
  gem "rubocop-capybara", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "web-console"
end

group :development, :test do
  gem "debug"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
