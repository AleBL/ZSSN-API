class TradeValidator
  attr_reader :inventory_from, :inventory_to

  def initialize(inventory_from:, inventory_to:)
    @inventory_from = inventory_from
    @inventory_to   = inventory_to
  end

  def valid?
    false if infected?

    inventory_from_points == inventory_to_points
  end

  private
  def infected?
    person_from = Person.where(inventory_id: inventory_from.id)[0]
    person_to   = Person.where(inventory_id: inventory_to.id)[0]

    (person_from.infected? || person_to.infected?)
  end

  def inventory_from_points
    ItemsCalc.new(inventory: inventory_from).total
  end

  def inventory_to_points
    ItemsCalc.new(inventory: inventory_to).total
  end
end
