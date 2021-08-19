source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'rails', '~> 6.1.4'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'haml'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'haml-rails'
gem 'httparty', require: false
gem "honeybadger", "~> 4.0"

group :development, :test do
  gem 'rubocop'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'spring-commands-rspec'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0.2'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'timecop'
end

group :development do
  gem 'listen', '~> 3.7'
  gem 'annotate'
end

gem 'codecov', require: false, group: :test

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
