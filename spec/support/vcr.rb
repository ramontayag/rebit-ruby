require 'vcr'
require 'webmock'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!

  SENSITIVE_VARIABLES = [
    "API_TOKEN",
    "VENDOR_API_TOKEN",
  ]
  SENSITIVE_VARIABLES.each do |var|
    config.filter_sensitive_data("<#{var}>") { ENV[var] }
  end
end
