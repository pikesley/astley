require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :webmock
  c.default_cassette_options = { record: :once }
  c.allow_http_connections_when_no_cassette = true

  [
      'token',
      'link'
  ].each do |env_var|
    c.filter_sensitive_data("<#{env_var}>") { ENV[env_var] }
  end

  c.configure_rspec_metadata!
end
