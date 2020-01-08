require 'rails_helper'

RSpec.describe ItemsCalc do
  describe "items calc" do
    let(:inventory) { create(:inventory_trade) }
    let(:total_spec) {
      (inventory.water      * 4) + 
      (inventory.food       * 3) + 
      (inventory.medication * 2) + 
      (inventory.ammunition * 1)
    }

    context "total is valid" do
      it "total is valid" do
        total_calc = ItemsCalc.new(inventory: inventory).total
        expect(total_calc).to eq(total_spec)
      end
    end

    context "total is invalid" do
      it "total is invalid" do
        result_not_spec = total_spec - rand(1..99)
        total_calc = ItemsCalc.new(inventory: inventory).total
        expect(total_calc).to_not eq(result_not_spec)
      end
    end
  end
end
