class TradeValidator
  attr_reader :inventory_from, :inventory_to, :trade_params

  def initialize(inventory_from:, inventory_to:, trade_params:)
    @inventory_from = inventory_from
    @inventory_to   = inventory_to
    @trade_params   = trade_params
  end

  def valid?
    return false unless inventory_from && inventory_to
    return false if infected?

    inventory_from_points == inventory_to_points
  end

  private

  def infected?
    person_from = inventory_from.person
    person_to   = inventory_to.person

    person_from.infected? || person_to.infected?
  end

  def inventory_from_points
    params_from = trade_params[:inventory_from]

    inventory_from_trade = Inventory.new do |i|
      i.water      = params_from[:water]
      i.food       = params_from[:food]
      i.medication = params_from[:medication]
      i.ammunition = params_from[:ammunition]
    end

    ItemsCalc.new(inventory: inventory_from_trade).total
  end

  def inventory_to_points
    params_to = trade_params[:inventory_to]

    inventory_to_trade = Inventory.new do |i|
      i.water      = params_to[:water]
      i.food       = params_to[:food]
      i.medication = params_to[:medication]
      i.ammunition = params_to[:ammunition]
    end

    ItemsCalc.new(inventory: inventory_to_trade).total
  end
end
