$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rebit'

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

SPEC_DIR = File.expand_path("../", __FILE__)
