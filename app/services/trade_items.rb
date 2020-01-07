class TradeItems
  attr_reader :inventory_from, :inventory_to, :trade_params

  def initialize(inventory_from:, inventory_to:, trade_params:)
    @inventory_from = inventory_from
    @inventory_to   = inventory_to
    @trade_params   = trade_params
  end

  def valid?
    return false unless valid_trade?

    ActiveRecord::Base.transaction do
      perform_trade
    end
  end

  private

  def valid_trade?
    TradeValidator.new(inventory_from: inventory_from,
                       inventory_to:   inventory_to,
                       trade_params:   trade_params).valid?
  end

  def perform_trade
    item_trader.remove_from
    item_trader.add_to
  end

  def item_trader
    @item_trader ||= ItemTrader.new(inventory_from: inventory_from,
                                    inventory_to:   inventory_to,
                                    trade_params:   trade_params)
  end


end
