class AverageResources
  attr_reader :people

  def initialize(params = {})
    @people = params.fetch(:people, Person.where(infected: false))
  end

  def average_items
    @average_items ||= average_water + average_food + average_medication + average_ammunition
  end

  def average_water
    @average_water ||= calculate_percentage(total_resources[:water])
  end

  def average_food
    @average_food ||= calculate_percentage(total_resources[:food])
  end

  def average_medication
    @average_medication ||= calculate_percentage(total_resources[:medication])
  end

  def average_ammunition
    @average_ammunition ||= calculate_percentage(total_resources[:ammunition])
  end

  def average_inventory
    {
      average_water: average_water.round(2),
      average_food: average_food.round(2),
      average_medication: average_medication.round(2),
      average_ammunition: average_ammunition.round(2),
      average_total: average_items.round(2)
    }
  end

  private

  def total_resources
    @total_resources ||= people.each_with_object(default_hash) do |person, hash|
      inventory = person.inventory

      hash[:water]      += inventory.water
      hash[:food]       += inventory.food
      hash[:medication] += inventory.medication
      hash[:ammunition] += inventory.ammunition
    end
  end

  def calculate_percentage(resource)
    @number_people ||= people.count.to_f
    return 0 if @number_people.zero?

    resource / @number_people
  end

  def default_hash
    { water: 0, food: 0, medication: 0, ammunition: 0 }
  end
end
