module Api
  class TradeItemsController < ApplicationController
    def create
      inventory_from = Inventory.find_by_id(trade_params[:inventory_from][:id])
      inventory_to   = Inventory.find_by_id(trade_params[:inventory_to][:id])

      trade = ::TradeItems.new(inventory_from: inventory_from,
                               inventory_to: inventory_to,
                               trade_params: trade_params)

      if trade.process_trade?
        render_success(t('inventory.trade.valid'))
      else
        render_unprocessable_entity_error(t('inventory.trade.invalid'))
      end
    end

    private

    def trade_params
      params.permit(
        inventory_from: %i[id water food medication ammunition],
        inventory_to: %i[id water food medication ammunition]
      )
    end
  end
end
