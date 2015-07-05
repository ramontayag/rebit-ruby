module Rebit
  class Vendor < ResourceBase

    attribute :vendor_api_token, String

    def users
      @user_collection ||= VendorUserCollection.
        new(vendor_api_token: self.vendor_api_token)
    end

  end
end
