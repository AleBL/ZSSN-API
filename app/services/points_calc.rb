class PointsCalc
  WEIGHTS = { water: 4, food: 3, medication: 2, ammunition: 1 }.freeze
  attr_reader :people

  def initialize(people:)
    @people = people
  end

  def total
    @total ||= water_points + food_points + medication_points + ammunition_points
  end

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

    @total_points = calculate_total_points
  end

  def default_hash
    { water: 0, food: 0, medication: 0, ammunition: 0 }
  end

  private

  def calculate_total_points
    people.each_with_object(default_hash) do |person, hash|
      inventory = person.inventory

      hash[:water]      += inventory.water
      hash[:food]       += inventory.food
      hash[:medication] += inventory.medication
      hash[:ammunition] += inventory.ammunition
    end
  end
end
