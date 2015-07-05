module Rebit
  class VendorBase < ResourceBase

    self.prefix = ResourceBase.prefix + "/vendors/:vendor_id"
    attribute :vendor_api_token, String

  end
end
