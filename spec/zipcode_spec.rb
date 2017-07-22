require 'spec_helper'

RSpec.describe Zipcode, type: :model do
  subject { described_class.new(zip: "98144", phzone: "8b") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a zip" do
      subject.zip = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a unique zip" do
      control =  described_class.create(zip: "12345", phzone: "5b")
      subject.zip = "12345"
      expect(subject).to_not be_valid
    end

    it "is not valid if the zip value is not a 5 digit number" do
      subject.zip = "@!@$%"
      expect(subject).to_not be_valid
      subject.zip = "123456"
      expect(subject).to_not be_valid
    end

    it "is not valid without a phzone" do
      subject.phzone = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if phzone value is not from the predefined values" do
      subject.phzone = "18"
      expect(subject).to_not be_valid
    end
  end
end
