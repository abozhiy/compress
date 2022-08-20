# frozen_string_literal: true

require 'pony'

Pony.options =
  if ENV['RACK_ENV'] == 'development'
    {
      via: LetterOpener::DeliveryMethod,
      via_options: { location: File.expand_path('tmp/letter_opener', APP_ROOT) }
    }
  else
    {
      via: :smtp,
      via_options: {
        address: '',
        port: '',
        domain: '',
        user_name: '',
        password: ''
      }
    }
  end
