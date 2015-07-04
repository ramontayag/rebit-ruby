module Rebit
  class ResourceBase < ActiveResource::Base

    self.site = "#{HOST}/api/#{API_VERSION}"

  end
end
