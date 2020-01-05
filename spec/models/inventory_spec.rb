require "rails_helper"

RSpec.describe Inventory, type: :model do
  context "Valid Inventory" do
    it "It is a valid inventory" do
      inventory = build(:inventory)

      expect(inventory.valid?).to be_truthy
    end
  end

  context "Invalid Inventory" do
    it "It is not a valid inventory, nil parameter" do
      inventory = build(:inventory)
      inventory.medication  = nil;

      expect(inventory.valid?).to be_falsy
    end

    it "It is not a valid inventory, negative parameter" do
      inventory = build(:inventory)
      inventory.ammunition  = FFaker::Random.rand(-99..-1)

      expect(inventory.valid?).to be_falsy
    end
  end
end
