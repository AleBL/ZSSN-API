require 'rails_helper'

RSpec.describe ItemsCalc do
  describe 'items calculator' do
    let(:inventory) { create(:inventory_trade) }

    context 'when calculating total with valid attributes' do
      let(:total_spec) do
        (inventory.water * described_class.WEIGHTS[:water]) +
          (inventory.food       * described_class.WEIGHTS[:food])       +
          (inventory.medication * described_class.WEIGHTS[:medication]) +
          (inventory.ammunition * described_class.WEIGHTS[:ammunition])
      end

      it 'expected total' do
        total_calc = described_class.new(inventory: inventory).total
        expect(total_calc).to eq(total_spec)
      end
    end

    context 'when calculating total with invalid attributes' do
      let(:total_not_spec) do
        (inventory.water * described_class.WEIGHTS[:water]) +
          (inventory.food       * described_class.WEIGHTS[:food]) +
          (inventory.medication * described_class.WEIGHTS[:medication])
      end

      it 'unexpected total' do
        total_calc = described_class.new(inventory: inventory).total
        expect(total_calc).not_to eq(total_not_spec)
      end
    end
  end
end
