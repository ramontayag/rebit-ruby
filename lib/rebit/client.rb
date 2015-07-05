module Rebit
  class Client

    def rates
      response = Typhoeus.get(Url.for(:rates))
      JSON.parse(response.body)
    end

    def vendors
      @vendor_collection || VendorCollection.new
    end

  end
end
