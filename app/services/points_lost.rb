class PointsLost
  attr_reader :people, :points_calc

  def initialize(params = {})
    @people = params.fetch(:people, Person.where(infected: true))
    @points_calc = PointsCalc.new(people: people)
  end

  delegate :total, to: :points_calc

  delegate :water_points, to: :points_calc

  delegate :food_points, to: :points_calc

  delegate :medication_points, to: :points_calc

  delegate :ammunition_points, to: :points_calc

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
