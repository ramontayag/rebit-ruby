require "spec_helper"

module Rebit
  RSpec.describe VendorUserResourceCollection do

    it "is a VendorResourceCollection" do
      expect(described_class < VendorResourceCollection).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:user_id, Integer) }
    end

  end
end
