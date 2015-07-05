module Rebit
  class VendorUserCollection < VendorResourceCollection

    def all
      VendorUser.all(default_prefix_options)
    end

    def create(attributes={})
      VendorUser.create(attributes.merge(default_prefix_options))
    end

    def find(id)
      VendorUser.find(id)
    end

    def default_prefix_options
      attributes.slice(:vendor_api_token)
    end

  end
end
