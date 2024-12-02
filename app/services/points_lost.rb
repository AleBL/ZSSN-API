class PointsLost
  attr_reader :people, :points_calc

  def initialize(params = {})
    @people = params.fetch(:people, Person.where(infected: true))
    @points_calc = PointsCalc.new(people: people)
  end

  def total
    points_calc.total
  end

  def water_points
    points_calc.water_points
  end

  def food_points
    points_calc.food_points
  end

  def medication_points
    points_calc.medication_points
  end

  def ammunition_points
    points_calc.ammunition_points
  end

  def lost_points_items
    {
      water: water_points,
      food: food_points,
      medication: medication_points,
      ammunition: ammunition_points,
      total: total
    }
  end
end
