require "spec_helper"

module Rebit
  RSpec.describe VendorBase do

    describe ".prefix" do
      it "is the vendor prefix" do
        prefix = described_class.prefix(vendor_api_token: "xyz")
        expect(prefix).to eq "/api/#{API_VERSION}/vendors/xyz/"
      end
    end

  end
end
