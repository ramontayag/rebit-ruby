require "spec_helper"

module Rebit
  RSpec.describe Url do

    describe ".for" do
      it "generates the API url" do
        expected_uri = URI.parse(HOST)
        expected_uri.path = "/api/#{API_VERSION}/rates"
        uri = described_class.for("rates")
        expect(uri).to eq expected_uri.to_s
      end

      context "with a token" do
        it "adds the options as parameters" do
          expected_uri = URI.parse(HOST)
          expected_uri.path = "/api/#{API_VERSION}/rates"
          expected_uri.query = "token=mytoken"
          uri = described_class.for("rates", token: "mytoken")
          expect(uri).to eq expected_uri.to_s
        end
      end
    end

  end
end
