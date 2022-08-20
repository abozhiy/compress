# frozen_string_literal: true

# module to load app
module ApplicationLoader
  extend self

  def load_app!
    require_app
    require_init
  end

  private

  def require_app
    require_file 'config/application'
  end

  def require_init
    require_dir 'config/initializers'
  end

  def require_file(path)
    require File.join(root, path)
  end

  def require_dir(path)
    path = File.join(root, path)
    Dir["#{path}/**/*.rb"]
      .sort
      .each { |file| require file }
  end

  def root
    File.expand_path('..', __dir__)
  end
end
