require "json"
require "virtus"
require "typhoeus"
require "active_resource"
require "active_support"
require "active_support/core_ext/object/to_query"
require "active_support/core_ext/module/attribute_accessors"

module Rebit

  HOST = "https://rebit.ph"
  API_VERSION = "v1"

  mattr_accessor :vendor_api_token

  def self.new
    Rebit::Client.new
  end

end

require "rebit/version"
require "rebit/client"
require "rebit/url"
require "rebit/models/resource_base"
require "rebit/models/vendor_resource_collection"
require "rebit/models/vendor_user_collection"
require "rebit/models/vendor"
require "rebit/models/vendor_base"
require "rebit/models/vendor_user"
