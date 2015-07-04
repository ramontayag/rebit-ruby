require "spec_helper"

describe "Vendor", vcr: {record: :once} do

  it "returns vendor information" do
    vendor = Rebit::Vendor.find(ENV["VENDOR_API_TOKEN"])
    expect(vendor.id).to be_an Integer
    expect(vendor.name).to be_a String
  end

end
