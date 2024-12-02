class ItemTrader
  attr_reader :inventory_from, :inventory_to, :trade_params

  def initialize(inventory_from:, inventory_to:, trade_params:)
    @inventory_from = inventory_from
    @inventory_to   = inventory_to
    @trade_params   = trade_params
  end

  def perform_trade
    process_trade(:from)
    process_trade(:to)
  end

  private

  def process_trade(direction)
    inventories = {
      from: inventory_from,
      to: inventory_to
    }

    trade_params[:"inventory_#{direction}"].each do |key, value|
      next if ['id', :id].include?(key) || !inventories[:from].respond_to?(key)

      adjust_inventory(
        inventories[:from], key, -value.to_i
      )
      adjust_inventory(
        inventories[:to], key, value.to_i
      )
    end
  end

  def adjust_inventory(inventory, key, adjustment)
    current_value = inventory.public_send(key).to_i
    updated_value = current_value + adjustment
    inventory.update!(key => updated_value)
  end
end
