require 'rails_helper'

RSpec.describe 'Trade Items' do
  describe 'post /api/trade_items' do
    context 'with valid attributes' do
      let(:person_to)   { create(:person_with_inventory) }
      let(:person_from) { create(:person_with_inventory) }

      it 'perform a new trade sucessfully' do
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

        post '/api/trade_items', params: trade_params_valid
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'with invalid attributes' do
    let(:person_to)   { create(:person_with_inventory) }
    let(:person_from) { create(:person_infected_with_inventory) }

    it 'failed to perform a new trade, person from is infected' do
      trade_params_valid = {
        inventory_from:
        {
          id: person_from.inventory.id,
          ammunition: 2
        },
        inventory_to:
        {
          id: person_to.inventory.id,
          medication: 10
        }
      }

      post '/api/trade_items', params: trade_params_valid
      expect(response).to have_http_status(:unprocessable_content)
    end
  end
end
