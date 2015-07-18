module Rebit
  class VendorUserCollection < VendorResourceCollection

    self.element_name = "user"

    def default_prefix_options
      attributes.slice(:vendor_api_token)
    end

  end
end
