require 'rails_helper'

RSpec.describe ItemTrader do
  describe "Trade Items" do
    let(:inventory_from) { create(:inventory_trade) }
    let(:inventory_to) { create(:inventory_trade) }

    let(:trade_params_valid) {{
        inventory_from:
        {
          id: inventory_from.id,
          water: 4
        },
        inventory_to:
        {
          id: inventory_to.id,
          ammunition: 8
        }
    }}

    context "valid trade" do
      it "#removefrom" do
        item_trader = ItemTrader.new(inventory_from: inventory_from, inventory_to: inventory_to, trade_params: trade_params_valid).remove_from
        expect(item_trader).to eq(trade_params_valid[:inventory_from])
      end

      it "#add_to" do
        item_trader = ItemTrader.new(inventory_from: inventory_from, inventory_to: inventory_to, trade_params: trade_params_valid).add_to
        expect(item_trader).to eq(trade_params_valid[:inventory_to])
      end
    end
  end
end
