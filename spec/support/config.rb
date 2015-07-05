RSpec.configure do |config|
  config.before do
    Rebit.vendor_api_token = ENV["VENDOR_API_TOKEN"]
  end
end
