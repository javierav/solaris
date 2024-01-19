source "https://rubygems.org"

## RUBY
ruby "3.2.2"

## RAILS
gem "rails"

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
gem "bindata"
gem "bootsnap", require: false
gem "concurrent-ruby"
gem "foreman"
gem "http"
gem "mqtt"
gem "rails-settings-cached"
gem "rufus-scheduler"
gem "solid_queue"
gem "sqids"

group :development do
  gem "amazing_print"
  gem "better_errors"
  gem "dotenv-rails"
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
