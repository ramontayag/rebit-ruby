require "spec_helper"

module Rebit
  RSpec.describe ResourceBase do

    describe ".site" do
      it "is set to rebit's site" do
        expect(described_class.site.to_s).to eq "https://rebit.ph"
      end
    end

    describe ".prefix and .prefix=" do
      it "allows reading and writing of `prefix`" do
        klass = Class.new(described_class)
        klass.prefix = "/api/v2/abcs/:abc_id"
        expect(klass.prefix).to eq "/api/v2/abcs/:abc_id"
      end

      it "is the version prefix by default" do
        expect(described_class.prefix).to eq "/api/#{API_VERSION}"
      end
    end

    describe ".collection_url" do
      subject { described_class.collection_url }
      it { is_expected.to eq "#{HOST}#{described_class.prefix}/resource_bases" }

      context "when there are tokens in the prefix to parse" do
        let(:klass) do
          Class.new(described_class) do
            self.prefix = "/vendors/:vendor_id"
            def self.name; "User"; end
          end
        end

        it "uses the prefix and replaces tokens" do
          expect(klass.collection_url(vendor_id: 98)).
            to eq "#{HOST}/vendors/98/users"
        end
      end
    end

    describe ".resource_name" do
      it "is the underscored class name by default" do
        expect(described_class.resource_name).to eq "resource_base"
      end
    end

    describe ".collection_name" do
      it "is the pluralized element name" do
        expect(described_class.collection_name).to eq "resource_bases"
      end
    end

  end
end
