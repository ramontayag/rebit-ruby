require "spec_helper"

module Rebit
  RSpec.describe VendorUserResource do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:user_id, Integer) }
    end

    it "has the vendor user prefix" do
      expect(described_class.prefix).
        to eq "/api/#{API_VERSION}/vendors/:vendor_id/users/:user_id"
    end

  end
end
