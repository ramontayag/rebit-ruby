require "spec_helper"

module Rebit
  RSpec.describe VendorUserCollection do

    it "is a vendor resource collection" do
      expect(described_class < VendorResourceCollection).to be true
    end

  end
end
