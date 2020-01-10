require "rails_helper"

RSpec.describe TradeValidator do
  describe "trade validator" do
    let(:person_from)    { create(:person_with_inventory) }
    let(:person_to)      { create(:person_with_inventory) }
    let(:inventory_from) { Inventory.find(person_from.inventory_id) }
    let(:inventory_to)   { Inventory.find(person_to.inventory_id) }

    context "#valid? true" do
      it "trade with valid attributes" do
        trade_params_valid = {
          inventory_from:
          {
            id: person_from.inventory_id,
            water: 2
          },
          inventory_to:
          {
            id: person_to.inventory_id,
            ammunition: 8
    
          }
        }
    
        trade_validator = TradeValidator.new(inventory_from: inventory_from,
                                             inventory_to:   inventory_to,
                                             trade_params:   trade_params_valid)
        expect(trade_validator.valid?).to be_truthy
      end
    end
    
    context "#valid? false" do
      it "trade with invalid attributes, person_to infected" do
        person_to.infected = true
        person_to.save
    
        trade_params_invalid = {
          inventory_from:
          {
            id: person_from.inventory_id,
            water: 2
          },
          inventory_to:
          {
            id: person_to.inventory_id,
            ammunition: 8
          }
        }
    
        trade_validator = TradeValidator.new(inventory_from: inventory_from,
                                             inventory_to:   inventory_to,
                                             trade_params:   trade_params_invalid)
        expect(trade_validator.valid?).to be_falsey
      end

      it "trade with invalid attributes, person_from infected" do
        person_from.infected = true
        person_from.save

        trade_params_invalid = {
          inventory_from:
          {
            id: person_from.inventory_id,
            food: 4
          },
          inventory_to:
          {
            id: person_to.inventory_id,
            water: 2,
            ammunition: 8
          }
        }

        trade_validator = TradeValidator.new(inventory_from: inventory_from,
                                             inventory_to:   inventory_to,
                                             trade_params:   trade_params_invalid)
        expect(trade_validator.valid?).to be_falsey
      end
    end
  end
end
