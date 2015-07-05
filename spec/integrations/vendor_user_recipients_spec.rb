require "spec_helper"

RSpec.describe "Vendor user recipients", type: :integration, vcr: {record: :once} do

  let(:vendor) { Rebit::Vendor.new(vendor_api_token: ENV["VENDOR_API_TOKEN"]) }
  let(:user) do
    vendor.users.create({
      first_name: "Jake",
      last_name: "Chambers",
      email: "jake+#{Time.now.to_i}@ka.tet",
    })
  end

  it "finds all recipients of a vendor user" do
    recipient = user.recipients.create(
      first_name: "Jake",
      last_name: "Chambers",
      email: "jake+#{Time.now.to_i}@ka.tet",
      mobile: "+639999999999",
      province: "Metro Manila",
    )

    recipient_id = recipient.id

    expect(user.recipients.all.map(&:id)).to include recipient_id
  end

  it "creates a recipient for the vendor" do
    expect(user).to be_persisted

    recipient = user.recipients.create(
      first_name: "Jake",
      last_name: "Chambers",
      email: "jake+#{Time.now.to_i}@ka.tet",
      mobile: "+639999999999",
      province: "Metro Manila",
    )

    expect(recipient).to be_persisted
  end

  it "finds recipient of the vendor user" do
    recipient = user.recipients.create(
      first_name: "Jake",
      last_name: "Chambers",
      email: "jake+#{Time.now.to_i}@ka.tet",
      mobile: "+639999999999",
      province: "Metro Manila",
    )

    expect(recipient).to be_persisted

    recipient = user.recipients.find(recipient.id)

    expect(recipient.first_name).to eq "Jake"
  end

end
