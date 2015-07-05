require "spec_helper"

module Rebit
  RSpec.describe PathParser do

    it "replaces token (starting with `:`) with the given values" do
      expect(described_class.parse("/api/:version", version: "v2")).
        to eq "/api/v2"
    end

    it "parses multiple tokens" do
      result = described_class.parse("/api/:parent_id/users/:id", {
        parent_id: "22",
        id: 3,
      })
      expect(result).to eq "/api/22/users/3"
    end

  end
end
