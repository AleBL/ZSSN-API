module Api
  class TradeItemsController < ApplicationController
    def create
      inventory_from = Inventory.find(trade_params[:inventory_from]["id"])
      inventory_to   = Inventory.find(trade_params[:inventory_to]["id"])

      trade = ::TradeItems.new(inventory_from: inventory_from,
                              inventory_to:   inventory_to,
                              trade_params:   trade_params)

      if trade.valid?
        render json: {status: I18n.t('status.success'), message: I18n.t('inventory.trade.valid')}, status: :ok
      else
        render json: {status: I18n.t('status.error'), message: I18n.t('inventory.trade.invalid')}, status: :unprocessable_entity
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
