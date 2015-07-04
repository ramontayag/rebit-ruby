require "spec_helper"

module Rebit
  RSpec.describe ResourceBase do

    describe ".site" do
      it "is set to rebit's site" do
        expect(described_class.site.to_s).
          to eq "https://rebit.ph/api/#{API_VERSION}"
      end
    end

  end
end
