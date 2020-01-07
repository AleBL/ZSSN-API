require 'rails_helper'

RSpec.describe ItemsCalc do
  describe "items calc" do
    let(:inventory) { create(:inventory_trade) }
    let(:total) {
                (inventory.water * 4) + 
                (inventory.food * 3) + 
                (inventory.medication * 2) + 
                (inventory.ammunition)
    }

    context "total is valid" do
      it "total is valid" do
        total_calc = ItemsCalc.new(inventory: inventory).total
        expect(total_calc).to eq(total)
      end
    end

    context "total is invalid" do
      it "total is invalid" do

        new_total = total - rand(1..99)
        total_calc = ItemsCalc.new(inventory: inventory).total
        expect(total_calc).to_not eq(new_total)
      end
    end
  end
end
