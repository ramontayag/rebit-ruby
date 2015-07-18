module Rebit
  class VendorUserRemittanceCollection < VendorUserResourceCollection

    self.element_name = "remittance"

    def default_create_params(attrs={})
      {
        element_name => attributes.merge(attrs),
        recipient_id: attrs[:recipient_id],
      }
    end

  end
end
