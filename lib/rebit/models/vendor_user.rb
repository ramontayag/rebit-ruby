module Rebit
  class VendorUser < VendorBase

    attribute :birthday, Date
    attribute :address, String
    attribute :city, String
    attribute :country, String
    attribute :email, String
    attribute :postal_code, String
    attribute :first_name, String
    attribute :last_name, String
    attribute :mobile, String
    attribute :mobile_confirmed, Boolean
    attribute :recipient_ids, Array[Integer]
    attribute :remittance_ids, Array[Integer]
    attribute :total_remittances_today, Integer
    attribute :wallet_address, String
    attribute :maximum_sends_per_day, Integer
    attribute :institutional, Boolean
    attribute :kyc_level, Integer

    def recipients
      @vendor_user_recipient_collection ||= VendorUserRecipientCollection.new(
        vendor_api_token: self.vendor_api_token,
        user_id: self.id,
      )
    end

    def persisted?
      id.present?
    end

  end
end
