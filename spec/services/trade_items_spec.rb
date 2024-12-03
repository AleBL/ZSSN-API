require 'rails_helper'

RSpec.describe TradeItems do
  describe 'trade items' do
    describe '#process_trade? true' do
      let(:person_from)    { create(:person_with_inventory) }
      let(:person_to)      { create(:person_with_inventory) }
      let(:inventory_from) { person_from.inventory          }
      let(:inventory_to)   { person_to.inventory            }

      let(:trade_params_valid) do
        {
          inventory_from:
          {
            id: inventory_from.id,
            medication: 20
          },
          inventory_to:
       {
         id: inventory_to.id,
         water: 5,
         ammunition: 20
       }
        }
      end

      it 'trade with valid attributes' do
        trade_items = described_class.new(inventory_from: inventory_from,
                                          inventory_to: inventory_to,
                                          trade_params: trade_params_valid)
        expect(trade_items).to be_process_trade
      end
    end

    describe '#process_trade? false' do
      let(:person_from_infected)    { create(:person_infected_with_inventory) }
      let(:person_to_infected)      { create(:person_infected_with_inventory) }
      let(:inventory_from_infected) { person_from_infected.inventory          }
      let(:inventory_to_infected)   { person_to_infected.inventory            }

      let(:trade_params_invalid) do
        {
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
        }
      end

      context 'when any person is infected' do
        it do
          trade_items = described_class.new(inventory_from: inventory_from_infected,
                                            inventory_to: inventory_to_infected,
                                            trade_params: trade_params_invalid)

          expect(trade_items).not_to be_process_trade
        end
      end
    end
  end
end
