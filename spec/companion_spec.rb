require 'spec_helper'

RSpec.describe Companion, type: :model do
  subject { described_class.new(start_seed_indoors: "March 15", plant_outdoors: "May 20") }

  describe "Associations" do
    it "belongs to a plant" do
      assc = described_class.reflect_on_association(:plant)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
