# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.0"

gem "bootsnap", ">= 1.4.2", require: false
gem "pg", "~> 1.5"
gem "psych", "< 4.0.0"
gem "puma", "~> 4.1"
gem "rack-cors"
gem "rails", "~> 6.0.6", ">= 6.0.6.1"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv-rails"
  gem "pry-byebug"
  gem "rspec-rails", "~> 5.1", ">= 5.1.2"
  gem "rubocop-shopify", require: false
end

group :development do
  gem "annotate"
  gem "bullet"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "factory_bot_rails"
  gem "faker", "~> 3.1"
  gem "shoulda-matchers", "~> 5.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
