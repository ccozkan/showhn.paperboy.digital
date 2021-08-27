source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "haml"
gem "haml-rails"
gem "honeybadger"
gem "httparty", require: false
gem "pg"
gem "puma"
gem "rails", github: "rails/rails", branch: "main"
gem "sass-rails"
gem "sidekiq"
gem "sidekiq-cron"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot"
  gem "factory_bot_rails"
  gem "pry"
  gem "pry-doc"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "shoulda-matchers"
  gem "spring-commands-rspec"
  gem "timecop"
end

group :development do
  gem "annotate"
  gem "listen"
end

gem "codecov", require: false, group: :test

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
