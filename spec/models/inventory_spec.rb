require 'rails_helper'

RSpec.describe Inventory do
  let(:inventory) { build(:inventory) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:water) }
    it { is_expected.to validate_presence_of(:food) }
    it { is_expected.to validate_presence_of(:medication) }
    it { is_expected.to validate_presence_of(:ammunition) }

    it { is_expected.to have_one(:person) }

    it { is_expected.to validate_numericality_of(:water).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:food).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:medication).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:ammunition).is_greater_than_or_equal_to(0) }
  end

  context 'when the inventory is valid' do
    it 'is a valid inventory' do
      expect(inventory).to be_valid
    end
  end

  context 'when the inventory is invalid' do
    it 'water is nil' do
      inventory.water = nil
      expect(inventory).not_to be_valid
    end

    it 'food is nil' do
      inventory.food = nil
      expect(inventory).not_to be_valid
    end

    it 'medication is nil' do
      inventory.medication = nil
      expect(inventory).not_to be_valid
    end

    it 'ammunition is nill' do
      inventory.ammunition = nil
      expect(inventory).not_to be_valid
    end

    it 'water is negative' do
      inventory.water = FFaker::Random.rand(-99..-1)

      expect(inventory).not_to be_valid
    end

    it 'food is negative' do
      inventory.food = FFaker::Random.rand(-99..-1)

      expect(inventory).not_to be_valid
    end

    it 'medication is negative' do
      inventory.medication = FFaker::Random.rand(-99..-1)

      expect(inventory).not_to be_valid
    end

    it 'ammunition is negative' do
      inventory.ammunition = FFaker::Random.rand(-99..-1)

      expect(inventory).not_to be_valid
    end
  end
end
