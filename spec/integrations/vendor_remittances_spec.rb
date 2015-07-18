require "spec_helper"

describe "Vendor remittances", vcr: {record: :once} do

  let(:vendor_client) do
    Rebit::Vendor.new(vendor_api_token: ENV["VENDOR_API_TOKEN"])
  end

  let(:user) do
    vendor_client.users.create!({
      first_name: "Roland",
      last_name: "Deschain",
      email:  "roland+#{Time.now.to_i}@ka.tet",
    })
  end

  let(:recipient) do
    user.recipients.create!(
      first_name: "Jake",
      last_name: "Chambers",
      email: "jake+#{Time.now.to_i}@ka.tet",
      mobile: "+639999999999",
      province: "Metro Manila",
    )
  end

  describe "Fetching all remittances" do
    let(:remittances) { user.remittances.all }
    let!(:remittance) do
      user.remittances.create!({
        recipient_id: recipient.id,
        amount: 10000.0,
        currency: 'PHP',
        strategy: 'bank',
        callback_url: 'https://callback.url',
        remittance_details: {
          bank: 'ABC',
          bank_account_type: "Peso Savings",
          bank_account_number: "123ABC123",
          bank_account_name: "Jose Aliali",
        }
      })
    end

    it "returns the user's remittances" do
      pending
      expect(remittances.first).to be_a VendorUserRemittance
      expect(remittances.last.amount).to eq 10000.0
    end
  end

  describe "Creating remittance" do
    let(:remittance) do
      user.remittances.create!({
        recipient_id: recipient.id,
        amount: 10000.0,
        currency: 'PHP',
        strategy: 'bank',
        callback_url: 'https://callback.url',
        remittance_details: {
          bank: 'ABC',
          bank_account_type: "Peso Savings",
          bank_account_number: "123ABC123",
          bank_account_name: "Jose Aliali",
        }
      })
    end

    it "creates a remittance" do
      expect(remittance.recipient_id).to eq recipient.id
      expect(remittance.amount).to eq 10000.0
      expect(remittance.remittance_details[:bank]).to eq "ABC"
    end
  end

  describe "Finding a remittance" do
    let!(:old_remittance) do
      user.remittances.create!({
        recipient_id: recipient.id,
        amount: 10000.0,
        currency: 'PHP',
        strategy: 'bank',
        callback_url: 'https://callback.url',
        remittance_details: {
          bank: 'ABC',
          bank_account_type: "Peso Savings",
          bank_account_number: "123ABC123",
          bank_account_name: "Jose Aliali",
        }
      })
    end

    it "returns a user matching the id" do
      remittance = user.remittances.find(old_remittance.id)
      expect(remittance.id).to eq old_remittance.id
    end
  end

end
