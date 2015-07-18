module Rebit
  class VendorUserCollection < VendorResourceCollection

    self.site = HOST
    self.prefix = "/api/#{API_VERSION}/vendors/:vendor_api_token"
    self.element_name = "user"

    def default_prefix_options
      attributes.slice(:vendor_api_token)
    end

    private

    def default_attributes
      attributes.slice(:vendor_api_token)
    end

  end
end
