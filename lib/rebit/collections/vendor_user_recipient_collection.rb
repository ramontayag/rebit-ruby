module Rebit
  class VendorUserRecipientCollection < VendorUserResourceCollection

    def all
      url = VendorUserRecipient.collection_url(default_prefix_options)
      response = Typhoeus.get(url)
      json = JSON.parse(response.body).map(&:with_indifferent_access)
      json.map { |hash| initialize_recipient(hash) }
    end

    def create(attributes={})
      url = VendorUserRecipient.collection_url(default_prefix_options)
      response = Typhoeus.post(url, body: { recipient: attributes })
      json = JSON.parse(response.body).with_indifferent_access
      initialize_recipient(json[:recipient])
    end

    def find(id)
      url = VendorUserRecipient.collection_url(default_prefix_options)
      url = "#{url}/#{id}"
      response = Typhoeus.get(url)
      json = JSON.parse(response.body).with_indifferent_access
      initialize_recipient(json[:recipient])
    end

    private

    def initialize_recipient(attributes={})
      VendorUserRecipient.new(attributes.merge(default_attributes))
    end

    def default_attributes
      attributes.slice(:user_id, :vendor_api_token)
    end

  end
end
