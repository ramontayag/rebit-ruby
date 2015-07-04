require "spec_helper"

RSpec.describe "Fetching rates", vcr: {record: :once} do

  describe "#rates" do
    let(:sample_json) do
      JSON.parse(File.read("#{SPEC_DIR}/fixtures/rates.json"))
    end

    it "returns the rates" do
      client = Rebit.new
      response = client.rates
      expect(response).to have_key(sample_json.keys.sample)
    end
  end

end
