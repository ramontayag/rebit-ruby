require "spec_helper"

describe "Vendor users", vcr: {record: :once} do

  describe "Creating users" do
    it "creates a new user" do
      user = Rebit::VendorUser.create({
        first_name: "Roland",
        last_name: "Deschain",
        email: "roland+#{Time.now.to_i}@ka.tet"
      })
      expect(user).to be_persisted
      expect(user.first_name).to eq "Roland"
    end
  end

  describe "Finding a user" do
    it "returns a user matching the id" do
      user = Rebit::VendorUser.create({
        first_name: "Eddie",
        last_name: "Dean",
        email: "eddit+#{Time.now.to_i}@ka.tet",
      })

      expect(user).to be_persisted

      user = Rebit::VendorUser.find(user.id)
      expect(user.first_name).to eq "Eddie"
    end
  end

end
