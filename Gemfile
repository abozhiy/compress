# frozen_string_literal: true

source 'https://rubygems.org'

gem 'puma', '= 5.6.4'
gem 'rack', '~> 2.2.3.1'
gem 'rack-contrib'
gem 'rack-cors'

gem 'sinatra', '~> 2.2.0'
gem 'sinatra-contrib'

gem 'pg', '~> 0.18'
gem 'sequel'

gem 'jsonapi-serializers'

gem 'dotenv'
gem 'racksh'
gem 'rake'
gem 'config'

gem 'pony' # Mail client

gem 'sidekiq'

gem 'redis'

gem 'rest-client'

gem 'image_optimizer'

group :development, :test do
  gem 'byebug'
  gem 'factory_bot'
  gem 'rack-test'
  gem 'rspec'
  gem 'rubocop'
  gem 'ruby-debug-ide'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-json_expectations'
  gem 'webmock'
end

group :development do
  gem 'debase'
  gem 'letter_opener'
end
