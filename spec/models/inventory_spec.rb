require "rails_helper"

RSpec.describe Inventory, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:water) }
    it { should validate_presence_of(:food) }
    it { should validate_presence_of(:medication) }
    it { should validate_presence_of(:ammunition) }
    
    it { should validate_numericality_of(:water).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:food).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:medication).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:ammunition).is_greater_than_or_equal_to(0) }
  end

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
