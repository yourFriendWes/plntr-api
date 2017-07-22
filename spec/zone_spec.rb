require 'spec_helper'

RSpec.describe Zone, type: :model do
  subject { described_class.new(main_zone: "10", lowest_avg_temp_from: "20") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a main_zone" do
      subject.main_zone = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a unique main_zone" do
      control = described_class.create(main_zone: "10", lowest_avg_temp_from: "-5")
      subject.main_zone = "10"
      subject.lowest_avg_temp_from = 15
      expect(subject).to_not be_valid
    end

    it "is not valid if the main_zone value is not a 2 digit number" do
      control = described_class.new(main_zone: "ten", lowest_avg_temp_from: "-5")
      expect(control).to_not be_valid
      control.main_zone = "179"
      expect(control).to_not be_valid
    end

    it "is not valid without a lowest_avg_temp_from" do
      subject.lowest_avg_temp_from = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "has many schedules" do
      assc = described_class.reflect_on_association(:schedules)
      expect(assc.macro).to eq :has_many
    end

    it "has many plants through schedules" do
      assc = described_class.reflect_on_association(:plants)
      expect(assc.macro).to eq :has_many
    end
  end
end
