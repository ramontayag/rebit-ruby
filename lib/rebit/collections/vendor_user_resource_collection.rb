module Rebit
  class VendorUserResourceCollection < VendorResourceCollection

    include Virtus.model
    attribute :user_id, Integer
    self.prefix = VendorResourceCollection.prefix + "/users/:user_id"

    def default_prefix_options
      attributes.slice(:user_id, :vendor_api_token)
    end

  end
end
