require "spec_helper"

module Rebit
  RSpec.describe VendorUserRecipient do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:id, Integer) }
      it { is_expected.to have_attribute(:user_id, Integer) }
      it { is_expected.to have_attribute(:first_name, String) }
      it { is_expected.to have_attribute(:middle_name, String) }
      it { is_expected.to have_attribute(:last_name, String) }
      it { is_expected.to have_attribute(:email, String) }
      it { is_expected.to have_attribute(:mobile, String) }
      it { is_expected.to have_attribute(:address, String) }
      it { is_expected.to have_attribute(:city, String) }
      it { is_expected.to have_attribute(:province, String) }
      it { is_expected.to have_attribute(:postal_code, String) }
      it { is_expected.to have_attribute(:created_at, Date) }
      it { is_expected.to have_attribute(:updated_at, Date) }
      it { is_expected.to have_attribute(:deleted_at, Date) }
      it { is_expected.to have_attribute(:created_via_api) } # Boolean
      it { is_expected.to have_attribute(:deleted) } # Boolean
      it { is_expected.to have_attribute(:business_name, String) }
      it { is_expected.to have_attribute(:business_slug, String) }
      it { is_expected.to have_attribute(:is_test) } # Boolean
    end
  end
end
