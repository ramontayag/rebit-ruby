module Rebit
  class VendorUserResourceCollection < VendorResourceCollection

    include Virtus.model
    attribute :user_id, Integer

    def default_prefix_options
      attributes.slice(:user_id).merge(vendor_id: self.vendor_api_token)
    end

  end
end
