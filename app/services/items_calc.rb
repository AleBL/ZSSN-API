class ItemsCalc
  WEIGHTS = {
    water:      4,
    food:       3,
    medication: 2,
    ammunition: 1
  }

  attr_reader :inventory

  def initialize(inventory:)
    @inventory = inventory
  end

  def total
    water + food + medication + ammunition
  end

  private

  def water
    inventory.water.nil? ? 0 : inventory.water * WEIGHTS[:water]
  end

  def food
    inventory.food.nil? ? 0 : inventory.food * WEIGHTS[:food]
  end

  def medication
    inventory.medication.nil? ? 0 : inventory.medication * WEIGHTS[:medication]
  end

  def ammunition
    inventory.ammunition.nil? ? 0 : inventory.ammunition * WEIGHTS[:ammunition]
  end

end
