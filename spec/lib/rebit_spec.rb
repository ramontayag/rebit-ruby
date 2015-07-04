require "spec_helper"

RSpec.describe Rebit do

  describe ".new" do
    it "creates a Rebit::Client" do
      client = described_class.new
      expect(client).to be_a(described_class::Client)
    end
  end

end
