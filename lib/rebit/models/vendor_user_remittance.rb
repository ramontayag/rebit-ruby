module Rebit
  class VendorUserRemittance < VendorUserResource

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
    attribute :recipient_id, Integer
    attribute :amount, Float
    attribute :currency, String
    attribute :strategy, String
    attribute :callback_url, String
    attribute :remittance_details, Hash, default: {}

    def remittance_details
      super.with_indifferent_access
    end

    def self.resource_name
      "recipient"
    end

  end
end
