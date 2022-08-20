# frozen_string_literal: true

source 'https://rubygems.org'

# Webserver
gem 'puma', '= 5.6.4'
gem 'rack', '~> 2.2.3.1'
gem 'rack-contrib' # For convert request body to params see ./config.ru
gem 'rack-cors'    # For enable CORS ./config.ru

# Framework
gem 'sinatra', '~> 2.2.0'

# Validators
# gem 'dry-validation'

# Database
gem 'pg', '~> 0.18'
gem 'sequel'

# Encryption
# gem 'bcrypt'
# gem 'jwt'

# Views
gem 'haml'
gem 'jsonapi-serializers'

# System
gem 'dotenv'
gem 'racksh'
gem 'rake'

# # AWS
# gem 'aws-sdk-s3', require: false
# gem 'aws-sdk-sns' # For write messages to sns
# gem 'aws-sdk-sqs'
# gem 'cyclone_lariat', require: false, git: 'git@github.com:am-team/cyclone_lariat.git'
# gem 'shoryuken'

# Mail server client
gem 'pony'

# Background jobs
gem 'sidekiq'

# gem 'rest-client'
# gem 'retriable'

# # Replacement for the URI implementation
# gem 'addressable'

# gem 'connection_pool'
gem 'redis'

group :development, :test do
  # gem 'awesome_print'
  gem 'byebug'
  gem 'factory_bot'
  # gem 'overcommit'
  # gem 'pry'
  # gem 'pry-byebug'
  gem 'rack-test'
  gem 'rerun'          # Code autoreload after change files in dev mode
  gem 'rspec'
  gem 'rubocop'
  gem 'ruby-debug-ide' # For rubymine
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-json_expectations'
  gem 'simplecov'
  gem 'timecop'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'letter_opener'
end
