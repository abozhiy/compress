# frozen_string_literal: true

REDIS_URL = 'redis://localhost:6379/'
uri = URI.parse(REDIS_URL)
REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password)
