module Rebit
  class VendorUserRecipient < VendorUserResource

    attribute :first_name, String
    attribute :middle_name, String
    attribute :last_name, String
    attribute :email, String
    attribute :mobile, String
    attribute :address, String
    attribute :city, String
    attribute :province, String
    attribute :postal_code, String
    attribute :created_at, Date
    attribute :updated_at, Date
    attribute :deleted_at, Date
    attribute :created_via_api, Boolean
    attribute :deleted, Boolean
    attribute :business_name, String
    attribute :business_slug, String
    attribute :is_test, Boolean

    def self.resource_name
      "recipient"
    end

  end
end
