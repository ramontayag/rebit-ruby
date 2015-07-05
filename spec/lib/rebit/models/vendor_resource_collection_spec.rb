require "spec_helper"

module Rebit
  RSpec.describe VendorResourceCollection do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:vendor_api_token, String) }
    end

  end
end
