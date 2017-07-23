require 'spec_helper'

RSpec.describe Schedule, type: :model do
  subject { described_class.new(start_seed_indoors: "March 15", plant_outdoors: "May 20") }

  # describe "Validations" do
  #   it "is valid with valid attributes" do
  #     expect(subject).to be_valid
  #     another_subject = described_class.new(spring_planting: "May 15", fall_planting: "September 20")
  #     expect(another_subject).to be_valid
  #   end
  #
  #   it "is not valid without a fall_planting, given spring_planting is not nil" do
  #     subject = described_class.new(spring_planting: "May 15")
  #     expect(subject).to_not be_valid
  #   end
  #
  #   it "is not valid without an plant_outdoors, given spring_planting and fall_planting is nil" do
  #     subject.plant_outdoors = nil
  #     expect(subject).to_not be_valid
  #   end
  # end

  describe "Associations" do
    it "belongs to a plant" do
      assc = described_class.reflect_on_association(:plant)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs tp=o a zone" do
      assc = described_class.reflect_on_association(:zone)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
