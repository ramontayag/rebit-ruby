require "httpi"
require "json"
require "active_support/core_ext/object/to_query"
require "rebit/version"
require "rebit/client"
require "rebit/url"

module Rebit

  HOST = "https://rebit.ph"
  API_VERSION = "v1"

  def self.new
    Rebit::Client.new
  end

end
