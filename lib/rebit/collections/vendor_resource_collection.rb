module Rebit
  class VendorResourceCollection < Collection

    self.site = HOST
    self.prefix = "/api/#{API_VERSION}/vendors/:vendor_api_token"
    attribute :vendor_api_token, String

    def default_all_params
      {element_name => attributes}
    end

    def default_create_params(attrs={})
      { element_name => attributes.merge(attrs) }
    end

  end
end
