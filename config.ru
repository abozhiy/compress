# frozen_string_literal: false

require_relative 'config/environment'

map '/images' do
  run ::Endpoints::Images
end
