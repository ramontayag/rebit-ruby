module Rebit
  class ResourceBase < ActiveResource::Base

    self.site = HOST
    self.prefix = "/api/#{API_VERSION}/"
    self.include_root_in_json = true
    self.remove_root = true

  end
end
