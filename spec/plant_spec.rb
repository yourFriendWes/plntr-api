require 'spec_helper'

RSpec.describe Plant, type: :model do
  subject { described_class.new(plant_type: "Vegetable", name:"Artichoke, Globe", sun_exposure: "Full Sun, Partial Sun", soil_ph: "Acidic, Neutral, Alkaline", soil_type: "Clay, Loam", soil_drainage: "Well Drained", water_requirement: "Drought Tolerant, Average", depth: "0.25", row_spacing: "36", plant_spacing: "24", img_url: "https://s3-us-west-2.amazonaws.com/plntr-assets/artichoke.jpg", description: "Artichoke is a handsome herbaceous edible perennial with large gray spined leaves and purple thistle-like flowers in autumn. native to the mediterranean region, artichoke is tender and often best") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a valid plant_type" do
      subject.plant_type = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a valid name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a valid img_url" do
      subject.img_url = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a valid sun_exposure" do
      subject.sun_exposure = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a valid soil_ph" do
      subject.soil_ph = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a valid soil_type" do
      subject.soil_type = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a valid soil_drainage" do
      subject.soil_drainage = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a valid water_requirement" do
      subject.water_requirement = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an spacing data, unless plant_type is Herb " do
      subject.row_spacing = nil
      subject.plant_spacing = nil
      subject.depth = nil
      expect(subject).to_not be_valid

      subject.plant_type = "Herb"
      expect(subject).to be_valid
    end
  end

  describe "Associations" do
    it "has many schedules" do
      assc = described_class.reflect_on_association(:schedules)
      expect(assc.macro).to eq :has_many
    end

    it "has many companions" do
      assc = described_class.reflect_on_association(:companions)
      expect(assc.macro).to eq :has_many
    end

    it "has many zones through schedules" do
      assc = described_class.reflect_on_association(:zones)
      expect(assc.macro).to eq :has_many
    end
  end
end
