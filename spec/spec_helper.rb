require 'bundler/setup'
require 'astley'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require_relative 'support/vcr'
