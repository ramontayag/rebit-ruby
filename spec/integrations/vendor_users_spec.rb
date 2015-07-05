require "spec_helper"

describe "Vendor users", vcr: {record: :once} do

  describe "Fetching all users" do
    it "returns users" do
      email = "roland+#{Time.now.to_i}@ka.tet"
      user = Rebit::VendorUser.create({
        first_name: "Roland",
        last_name: "Deschain",
        email: email,
      })
      expect(user).to be_persisted

      users = Rebit::VendorUser.all
      expect(users.map(&:id)).to include user.id
    end
  end

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

  describe "Deleting a user" do
    it "deletes a user" do
      pending
      user = Rebit::VendorUser.create({
        first_name: "Susanna",
        last_name: "Dean",
        email: "susanna+#{Time.now.to_i}@ka.tet",
      })

      user_id = user.id

      expect(user).to be_persisted

      user.destroy

      expect { Rebit::VendorUser.find(user_id) }.
        to raise_error(ActiveResource::ResourceNotFound)
    end
  end

end
