require "spec_helper"

module Rebit
  RSpec.describe Vendor do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:vendor_api_token, String) }
      it { is_expected.to have_attribute(:name, String) }
      it { is_expected.to have_attribute(:url, String) }
      it { is_expected.to have_attribute(:logo_url, String) }
      it { is_expected.to have_attribute(:phone, String) }
      it { is_expected.to have_attribute(:email, String) }
      it { is_expected.to have_attribute(:active) } # Boolean
      it { is_expected.to have_attribute(:user_ids, Array[Integer]) }
    end

  end
end
