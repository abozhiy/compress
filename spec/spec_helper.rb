RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.after(:suite) do # or :each or :all
    Dir["#{APP_ROOT}/public/uploads/*_spec.*"].each do |file|
      File.delete(file)
    end
  end
end
