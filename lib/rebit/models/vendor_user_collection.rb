module Rebit
  class VendorUserCollection < VendorResourceCollection

    def collection_url
      "#{HOST}/api/#{API_VERSION}/vendors/#{vendor_api_token}/users"
    end

    def resource_url
      "#{collection_url}/#{id}"
    end

    def all
      response = Typhoeus.get(collection_url, body: { user: attributes })
      user_hashes = JSON.parse(response.body).map(&:with_indifferent_access)
      user_hashes.map { |hash| VendorUser.new(hash) }
    end

    def create(attributes={})
      response = Typhoeus.post(collection_url, body: { user: attributes })
      json = JSON.parse(response.body).with_indifferent_access
      VendorUser.new(json[:user])
    end

    def find(id)
      response = Typhoeus.get("#{collection_url}/#{id}")
      json = JSON.parse(response.body).with_indifferent_access
      VendorUser.new(json[:user])
    end

    def default_prefix_options
      attributes.slice(:vendor_api_token)
    end

  end
end
