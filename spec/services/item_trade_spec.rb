require 'rails_helper'

RSpec.describe ItemTrader do
  describe 'Trade Items' do
    let(:inventory_from) { create(:inventory_trade) }
    let(:inventory_to)   { create(:inventory_trade) }

    let(:trade_params_valid) do
      {
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
      }
    end
  end
end
