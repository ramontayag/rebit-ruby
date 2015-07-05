module Rebit
  class Vendor < ResourceBase

    attribute :vendor_api_token, String
    attribute :name, String
    attribute :url, String
    attribute :logo_url, String
    attribute :phone, String
    attribute :email, String
    attribute :active, Boolean
    attribute :user_ids, Array[Integer]

    def users
      @user_collection ||= VendorUserCollection.
        new(vendor_api_token: self.vendor_api_token)
    end

  end
end
