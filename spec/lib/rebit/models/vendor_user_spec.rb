require "spec_helper"

module Rebit
  RSpec.describe VendorUser, type: :model do

    describe ".element_name" do
      subject { described_class.element_name }
      it { is_expected.to eq "user" }
    end

  end
end
