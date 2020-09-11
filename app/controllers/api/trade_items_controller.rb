module Api
  class TradeItemsController < ApplicationController
    def create
      inventory_from = Inventory.find_by_id(trade_params[:inventory_from][:id])
      inventory_to   = Inventory.find_by_id(trade_params[:inventory_to][:id])

      trade = ::TradeItems.new(inventory_from: inventory_from,
                              inventory_to:   inventory_to,
                              trade_params:   trade_params)

      if trade.valid?
        render json: { status: t('status.success'), message: t('inventory.trade.valid') }, status: :ok
      else
        render json: { status: t('status.error'), message: t('inventory.trade.invalid') }, status: :unprocessable_entity
      end
    end

    private
    def trade_params
      params.permit(
        inventory_from: [:id, :water, :food, :medication, :ammunition],
        inventory_to:   [:id, :water, :food, :medication, :ammunition])
    end

  end
end
