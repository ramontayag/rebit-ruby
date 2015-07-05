require "spec_helper"

RSpec.describe Rebit do

  describe ".new" do
    it "creates a Rebit::Client" do
      client = described_class.new
      expect(client).to be_a(described_class::Client)
    end
  end

  describe ".vendor_api_token / .vendor_api_token=" do
    it "allows you to read and set the vendor_api_token" do
      Rebit.vendor_api_token = "123"
      expect(Rebit.vendor_api_token).to eq "123"
    end
  end

end
