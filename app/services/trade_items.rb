class TradeItems
  attr_reader :inventory_from, :inventory_to, :trade_params

  def initialize(inventory_from:, inventory_to:, trade_params:)
    @inventory_from = inventory_from
    @inventory_to   = inventory_to
    @trade_params   = trade_params
  end

  def process_trade?
    return false unless trade_valid?

    perform_trade_with_transaction
  end

  private

  def trade_valid?
    TradeValidator.new(
      inventory_from: inventory_from,
      inventory_to: inventory_to,
      trade_params: trade_params
    ).valid?
  end

  def perform_trade_with_transaction
    ActiveRecord::Base.transaction { item_trader.perform_trade }
  end

  def item_trader
    @item_trader ||= ItemTrader.new(
      inventory_from: inventory_from,
      inventory_to: inventory_to,
      trade_params: trade_params
    )
  end
end
