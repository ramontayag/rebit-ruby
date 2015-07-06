require "spec_helper"

module Rebit
  RSpec.describe Collection do

    module Testing
      User = Class.new do
      end

      UserCollection = Class.new(Collection) do
        self.site = "https://url.com"
        self.prefix = "/api/:api_version"
      end

      BusDriver = Class.new do
        include Virtus.model
        attribute :name, String
      end

      BusDriverCollection = Class.new(Collection) do
        self.site = "https://url.com"
        self.prefix = "/api/:api_version"
      end
    end

    describe ".site accessor" do
      specify do
        expect(Testing::UserCollection.site).to eq "https://url.com"
      end
    end

    describe ".prefix accessor" do
      specify do
        expect(Testing::UserCollection.prefix).to eq "/api/:api_version"
      end
    end

    describe "#site" do
      it "defaults to the class' site" do
        expect(Testing::UserCollection.new.site).to eq "https://url.com"
      end
    end

    describe "#prefix" do
      it "defaults to the class' prefix" do
        expect(Testing::UserCollection.new.prefix).to eq "/api/:api_version"
      end
    end

    describe "#collection_url" do
      let(:collection) { Testing::UserCollection.new }
      let(:url) { collection.collection_url(api_version: "v1") }
      it "is built from the site and prefix, replacing any prefix tokens" do
        expect(url).to eq "https://url.com/api/v1/users"
      end
    end

    describe "#element_url" do
      let(:collection) { Testing::UserCollection.new }
      let(:url) { collection.element_url(898, api_version: "v2") }
      it "is the collection_url plus the id" do
        expect(url).to eq "#{collection.collection_url(api_version: "v2")}/898"
      end
    end

    describe "#element_name" do
      subject { Testing::BusDriverCollection }
      it do
        is_expected.to have_attribute(:element_name, String).
          with_default(:default_element_name)
      end
      it "is the underscored class name" do
        expect(subject.new.element_name).to eq "bus_driver"
      end
    end

    describe "#collection_name" do
      subject { Testing::BusDriverCollection }
      it do
        is_expected.to have_attribute(:collection_name, String).
          with_default(:default_collection_name)
      end
      it "is the underscored, pluralized element name" do
        expect(subject.new.collection_name).to eq "bus_drivers"
      end
    end

    describe "#element_response_body" do
      let(:collection) { Testing::BusDriverCollection.new }
      let(:element_url) { collection.element_url(2, api_version: "v1") }
      let(:response) do
        double(Typhoeus::Response, body: {name: "Roland"}.to_json)
      end

      before do
        expect(Typhoeus).to receive(:get).with(element_url).
          and_return(response)
      end

      it "returns the parsed data that will be used to initialize an instance" do
        expect(collection.element_response_body(2, api_version: "v1")).
          to match({name: "Roland"})
      end
    end

    describe "#find" do
      let(:collection) { Testing::BusDriverCollection.new }

      before do
        expect(collection).to receive(:element_response_body).
          with(2, api_version: "v1").and_return({name: "Roland"})
      end

      it "instantiates a model based on the element response body" do
        bus_driver = collection.find(2, api_version: "v1")
        expect(bus_driver).to be_a Testing::BusDriver
        expect(bus_driver.name).to eq "Roland"
      end
    end

  end
end
