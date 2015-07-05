require "spec_helper"

module Rebit
  RSpec.describe ResourceBase do

    describe ".site" do
      it "is set to rebit's site" do
        expect(described_class.site.to_s).to eq "https://rebit.ph"
      end
    end

    describe ".prefix" do
      it "has the api version path" do
        expect(described_class.prefix).to eq "/api/#{API_VERSION}/"
      end
    end

    it "includes the root in the json" do
      expect(described_class.include_root_in_json).to be true
    end

    describe ".remove_root" do
      subject { described_class.remove_root }
      it { is_expected.to be true }
    end

  end
end
