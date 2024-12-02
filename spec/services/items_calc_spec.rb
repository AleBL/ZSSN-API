require 'rails_helper'

RSpec.describe ItemsCalc do
  describe 'items calculator' do
    let(:inventory) { create(:inventory_trade) }

    context 'total with valid attributes' do
      let(:total_spec) do
        (inventory.water * ItemsCalc.WEIGHTS[:water]) +
          (inventory.food       * ItemsCalc.WEIGHTS[:food])       +
          (inventory.medication * ItemsCalc.WEIGHTS[:medication]) +
          (inventory.ammunition * ItemsCalc.WEIGHTS[:ammunition])
      end

      it 'expected total' do
        total_calc = ItemsCalc.new(inventory: inventory).total
        expect(total_calc).to eq(total_spec)
      end
    end

    context 'total with invalid attributes' do
      let(:total_not_spec) do
        (inventory.water * ItemsCalc.WEIGHTS[:water]) +
          (inventory.food       * ItemsCalc.WEIGHTS[:food]) +
          (inventory.medication * ItemsCalc.WEIGHTS[:medication])
      end

      it 'unexpected total' do
        total_calc = ItemsCalc.new(inventory: inventory).total
        expect(total_calc).to_not eq(total_not_spec)
      end
    end
  end
end
