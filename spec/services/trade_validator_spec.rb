require 'rails_helper'

RSpec.describe TradeValidator do
  describe 'trade validator' do
    let(:person_from)    { create(:person_with_inventory) }
    let(:person_to)      { create(:person_with_inventory) }
    let(:inventory_from) { person_from.inventory          }
    let(:inventory_to)   { person_to.inventory            }

    describe '#valid? true' do
      it 'trade with valid attributes' do
        trade_params_valid = {
          inventory_from:
          {
            id: inventory_from.id,
            water: 2
          },
          inventory_to:
          {
            id: inventory_to.id,
            ammunition: 8

          }
        }

        trade_validator = described_class.new(inventory_from: inventory_from,
                                              inventory_to: inventory_to,
                                              trade_params: trade_params_valid)
        expect(trade_validator).to be_valid
      end
    end

    describe '#valid? false' do
      let(:person_from_infected)    { create(:person_infected_with_inventory) }
      let(:person_to_infected)      { create(:person_infected_with_inventory) }
      let(:inventory_from_infected) { person_from_infected.inventory          }
      let(:inventory_to_infected)   { person_to_infected.inventory            }

      it 'trade with invalid attributes, person_to infected' do
        trade_params_invalid = {
          inventory_from:
          {
            id: inventory_from.id,
            water: 2
          },
          inventory_to:
          {
            id: inventory_to_infected.id,
            ammunition: 8
          }
        }

        trade_validator = described_class.new(inventory_from: inventory_from_infected,
                                              inventory_to: inventory_to_infected,
                                              trade_params: trade_params_invalid)
        expect(trade_validator).not_to be_valid
      end

      it 'trade with invalid attributes, person_from infected' do
        trade_params_invalid = {
          inventory_from:
          {
            id: inventory_from_infected.id,
            food: 4
          },
          inventory_to:
          {
            id: inventory_to.id,
            water: 2,
            ammunition: 8
          }
        }

        trade_validator = described_class.new(inventory_from: inventory_from_infected,
                                              inventory_to: inventory_to_infected,
                                              trade_params: trade_params_invalid)
        expect(trade_validator).not_to be_valid
      end
    end
  end
end
