source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.4"

gem "haml"
gem "haml-rails"
gem "honeybadger", "~> 4.0"
gem "httparty", require: false
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.4"
gem "sass-rails", ">= 6"
gem "sidekiq"
gem "sidekiq-cron"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot"
  gem "factory_bot_rails"
  gem "pry"
  gem "pry-doc"
  gem "pry-rails"
  gem "rspec-rails", "~> 5.0.2"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "shoulda-matchers", "~> 5.0"
  gem "spring-commands-rspec"
  gem "timecop"
end

group :development do
  gem "annotate"
  gem "listen", "~> 3.7"
end

gem "codecov", require: false, group: :test

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
