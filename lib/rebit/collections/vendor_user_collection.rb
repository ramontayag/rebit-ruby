module Rebit
  class VendorUserCollection < VendorResourceCollection

    self.site = HOST
    self.prefix = "/api/#{API_VERSION}/vendors/:vendor_api_token"
    self.element_name = "user"

    def all
      response = Typhoeus.get(collection_url, body: { user: attributes })
      user_hashes = JSON.parse(response.body).map(&:with_indifferent_access)
      user_hashes.map { |hash| initialize_user(hash) }
    end

    def create(attributes={})
      response = Typhoeus.post(collection_url, body: { user: attributes })
      json = JSON.parse(response.body).with_indifferent_access
      initialize_user(json[:user])
    end

    def find(id)
      response = Typhoeus.get("#{collection_url}/#{id}")
      json = JSON.parse(response.body).with_indifferent_access
      initialize_user(json[:user])
    end

    def default_prefix_options
      attributes.slice(:vendor_api_token)
    end

    private

    def initialize_user(attributes)
      VendorUser.new(attributes.merge(default_attributes))
    end

    def default_attributes
      attributes.slice(:vendor_api_token)
    end

  end
end
