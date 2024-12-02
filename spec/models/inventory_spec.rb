require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:water) }
    it { should validate_presence_of(:food) }
    it { should validate_presence_of(:medication) }
    it { should validate_presence_of(:ammunition) }

    it { should have_one(:person) }

    it { should validate_numericality_of(:water).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:food).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:medication).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:ammunition).is_greater_than_or_equal_to(0) }
  end

  let(:inventory) { build(:inventory) }

  context 'Valid Inventory' do
    it 'It is a valid inventory' do
      expect(inventory.valid?).to be_truthy
    end
  end

  context 'Invalid Inventory' do
    it 'water is nil' do
      inventory.water = nil
      expect(inventory.valid?).to be_falsy
    end

    it 'food is nil' do
      inventory.food = nil
      expect(inventory.valid?).to be_falsy
    end

    it 'medication is nil' do
      inventory.medication = nil
      expect(inventory.valid?).to be_falsy
    end

    it 'ammunition is nill' do
      inventory.ammunition = nil
      expect(inventory.valid?).to be_falsy
    end

    it 'water is negative' do
      inventory.water = FFaker::Random.rand(-99..-1)

      expect(inventory.valid?).to be_falsy
    end

    it 'food is negative' do
      inventory.food = FFaker::Random.rand(-99..-1)

      expect(inventory.valid?).to be_falsy
    end

    it 'medication is negative' do
      inventory.medication = FFaker::Random.rand(-99..-1)

      expect(inventory.valid?).to be_falsy
    end

    it 'ammunition is negative' do
      inventory.ammunition = FFaker::Random.rand(-99..-1)

      expect(inventory.valid?).to be_falsy
    end
  end
end
