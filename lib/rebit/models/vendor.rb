module Rebit
  class Vendor < ResourceBase

    def users
      @user_collection ||= VendorUserCollection.
        new(vendor_api_token: self.vendor_api_token)
    end

  end
end
