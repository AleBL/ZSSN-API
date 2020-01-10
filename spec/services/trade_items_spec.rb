require "rails_helper"

RSpec.describe TradeItems do
  describe "trade items" do
    let(:inventory_from) { create(:inventory_trade) }
    let(:inventory_to)   { create(:inventory_trade)}

    let(:person_from_infected)    { create(:person_infected_with_inventory) }
    let(:person_to_infected)      { create(:person_infected_with_inventory) }
    let(:inventory_from_infected) { Inventory.find(person_from_infected.inventory_id) }
    let(:inventory_to_infected)   { Inventory.find(person_to_infected.inventory_id) }

    let(:trade_params_valid) {{
      inventory_from:
      {
        id: inventory_from.id,
        medication: 20
      },
      inventory_to:
      {
        id: inventory_to.id,
        water: 10,
        ammunition: 20
      }
    }}

    let(:trade_params_invalid) {{
      inventory_from:
      {
        id: inventory_from_infected.id,
        ammunition: 25
      },
      inventory_to:
      {
        id: inventory_to_infected.id,
        food: 10,
        medication: 20
      }
    }}

    context "#valid? true" do
      it "trade with valid attributes" do
        trade_items = TradeItems.new(inventory_from: inventory_from,
                                     inventory_to:   inventory_to,
                                     trade_params:   trade_params_valid)
        expect(trade_items.valid?).to be_truthy
      end
    end
    
    context "#valid? false" do
      it "trade with invalid attributes, person_to infected" do
        trade_items = TradeItems.new(inventory_from: inventory_from_infected,
                                     inventory_to:   inventory_to_infected,
                                     trade_params:   trade_params_invalid)

        expect(trade_items.valid?).to be_falsey
      end

      it "trade with invalid attributes, person_from infected" do
        trade_items = TradeItems.new(inventory_from: inventory_from_infected,
                                     inventory_to:   inventory_to_infected,
                                     trade_params:   trade_params_invalid)
        expect(trade_items.valid?).to be_falsey
      end
    end
  end
end
