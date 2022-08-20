# frozen_string_literal: false

require 'spec_helper'

ENV['RACK_ENV'] ||= 'development'

require_relative '../config/environment'

abort('You in prod mode!') if Application.environment == :production

RSpec.configure do |config|
  config.include Rack::Tests::Methods
  config.include RouteHelpers, type: :routes
end
