require "spec_helper"

module Rebit
  RSpec.describe VendorUser, type: :model do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:vendor_api_token, String) }
      it { is_expected.to have_attribute(:id, Integer) }
      it { is_expected.to have_attribute(:birthday, Date) }
      it { is_expected.to have_attribute(:address, String) }
      it { is_expected.to have_attribute(:city, String) }
      it { is_expected.to have_attribute(:country, String) }
      it { is_expected.to have_attribute(:email, String) }
      it { is_expected.to have_attribute(:postal_code, String) }
      it { is_expected.to have_attribute(:first_name, String) }
      it { is_expected.to have_attribute(:last_name, String) }
      it { is_expected.to have_attribute(:mobile, String) }
      it { is_expected.to have_attribute(:mobile_confirmed) } # Boolean
      it { is_expected.to have_attribute(:recipient_ids, Array[Integer]) }
      it { is_expected.to have_attribute(:remittance_ids, Array[Integer]) }
      it { is_expected.to have_attribute(:total_remittances_today, Integer) }
      it { is_expected.to have_attribute(:wallet_address, String) }
      it { is_expected.to have_attribute(:maximum_sends_per_day, Integer) }
      it { is_expected.to have_attribute(:institutional) } # Boolean
      it { is_expected.to have_attribute(:kyc_level, Integer) }
    end

    describe "#recipients" do
      it "instantiates a recipients collection with the vendor and user info" do
        user = described_class.new(vendor_api_token: "token", id: 3)
        collection = user.recipients
        expect(collection.vendor_api_token).to eq "token"
        expect(collection.user_id).to eq 3
      end
    end

    describe "#remittances" do
      let(:collection) { double(VendorUserRemittanceCollection) }
      it "instantiates a remittances collection with the vendor and user info" do
        user = described_class.new(vendor_api_token: "token", id: 3)
        expect(VendorUserRemittanceCollection).to receive(:new).
          with(vendor_api_token: "token", user_id: 3).
          and_return(collection)
        expect(user.remittances).to eq collection
      end
    end

  end
end
