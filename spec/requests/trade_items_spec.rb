require "rails_helper"

RSpec.describe "Trade Items", type: :request do
  describe "post /api/trade_items" do
    context "valid attributes" do
      let(:person_to)   { create(:person_with_inventory) }
      let(:person_from) { create(:person_with_inventory) }

      it "perform a new trade sucessfully" do
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

        post "/api/trade_items", params: trade_params_valid
        expect(response).to have_http_status(200)
      end
    end
  end
end

context "invalid attributes" do
  let(:person_to)   { create(:person_with_inventory) }
  let(:person_from) { create(:person_infected_with_inventory) }
  
  it "failed to perform a new trade, person from is infected" do
    trade_params_valid = {
      inventory_from:
      {
        id: person_from.inventory_id,
        ammunition: 2
      },
      inventory_to:
      {
        id: person_to.inventory_id,
        medication: 10
      }
    }

    post "/api/trade_items", params: trade_params_valid
    expect(response).to have_http_status(422)
  end
end