require "rails_helper"

RSpec.describe Inventory, type: :model do
  let(:inventory) { build(:inventory) }

  context "Valid Inventory" do
    it "It is a valid inventory" do
      expect(inventory.valid?).to be_truthy
    end
  end

  context "Invalid Inventory" do
    it "It is not a valid inventory, nil parameter" do
      inventory.medication  = nil;
      expect(inventory.valid?).to be_falsy
    end

    it "It is not a valid inventory, negative parameter" do
      inventory.ammunition  = FFaker::Random.rand(-99..-1)

      expect(inventory.valid?).to be_falsy
    end
  end
end
