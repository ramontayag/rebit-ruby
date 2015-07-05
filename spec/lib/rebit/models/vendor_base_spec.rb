require "spec_helper"

module Rebit
  RSpec.describe VendorBase do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:vendor_api_token, String) }
    end

    describe ".prefix" do
      it "is the vendor prefix" do
        expect(described_class.prefix).
          to eq "/api/#{API_VERSION}/vendors/:vendor_id"
      end
    end

  end
end
