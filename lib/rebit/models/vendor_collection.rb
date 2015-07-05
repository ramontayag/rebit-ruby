module Rebit
  class VendorCollection

    def find(vendor_api_token)
      url = "#{Vendor.collection_url}/#{vendor_api_token}"
      response = Typhoeus.get(url)
      json = JSON.parse(response.body).with_indifferent_access
      Vendor.new(json[:vendor])
    end

  end
end
