class ItemTrader
  attr_reader :inventory_from, :inventory_to, :trade_params

  def initialize(inventory_from:, inventory_to:, trade_params:)
    @inventory_from = inventory_from
    @inventory_to   = inventory_to
    @trade_params   = trade_params
  end

  def remove_from
   trade_params[:inventory_from].each do |key, value|
      next if ["id", :id].include?(key) || !inventory_from.respond_to?(key)
      current_from_value = inventory_from.public_send(key)
      updated_from_value = current_from_value.to_i - value.to_i
      current_to_value   = inventory_to.public_send(key)
      updated_to_value   = current_to_value.to_i + value.to_i
      inventory_from.update!(key => updated_from_value)
      inventory_to.update!(key => updated_to_value)
    end
  end

  def add_to
    trade_params[:inventory_to].each do |key, value|
      next if ["id", :id].include?(key) || !inventory_to.respond_to?(key)
      current_from_value = inventory_from.public_send(key)
      updated_from_value = current_from_value.to_i + value.to_i
      current_to_value   = inventory_to.public_send(key)
      updated_to_value   = current_to_value.to_i - value.to_i
      inventory_from.update!(key => updated_from_value)
      inventory_to.update!(key => updated_to_value)
    end
  end
end
