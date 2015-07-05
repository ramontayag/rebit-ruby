require "spec_helper"

describe "Vendor", vcr: {record: :once} do

  let(:rebit) { Rebit.new }

  it "returns vendor information" do
    vendor = rebit.vendors.find(ENV["VENDOR_API_TOKEN"])
    expect(vendor.id).to be_an Integer
    expect(vendor.name).to be_a String
  end

end
