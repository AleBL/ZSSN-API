class PointsLost
  WEIGHTS = { water: 4, food: 3, medication: 2, ammunition: 1 }
  attr_reader :people

  def initialize(params = {})
    @people = params.fetch(:people, Person.where(infected: true))
  end

  def total
    @total ||= water_points + food_points + medication_points + ammunition_points
  end

  def lost_points
    { water: water_points, food: food_points, medication: medication_points, ammunition: ammunition_points }
  end

  private

  def water_points
    total_points[:water] * WEIGHTS[:water]
  end

  def food_points
    total_points[:food] * WEIGHTS[:food]
  end

  def medication_points
    total_points[:medication] * WEIGHTS[:medication]
  end

  def ammunition_points
    total_points[:ammunition] * WEIGHTS[:ammunition]
  end

  def total_points
    return @total_points if defined?(@total_points)
    @total_points = people.inject(default_hash) do |hash, person|
      inventory = Inventory.find(person.inventory_id)

      hash[:water]      += inventory.water
      hash[:food]       += inventory.food
      hash[:medication] += inventory.medication
      hash[:ammunition] += inventory.ammunition
      hash
    end
  end

  def default_hash
    { water: 0, food: 0, medication: 0, ammunition: 0 }
  end
end
