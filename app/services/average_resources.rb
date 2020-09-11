class AverageResources
  attr_reader :people

  def initialize(params = {})
    @people ||= params.fetch(:people, Person.where(infected: false))
  end

  def average_items
    @total ||= average_water + average_food + average_medication + average_ammunition
  end

  def average_water
    calculate_percentage(total_resources[:water])
  end

  def average_food
    calculate_percentage(total_resources[:food])
  end

  def average_medication
    calculate_percentage(total_resources[:medication])
  end

  def average_ammunition
    calculate_percentage(total_resources[:ammunition])
  end

  private

  def total_resources
    return @total_resources if defined?(@total_resources)
    @total_resources = people.inject(default_hash) do |hash, person|
      inventory = person.inventory

      hash[:water]      += inventory.water
      hash[:food]       += inventory.food
      hash[:medication] += inventory.medication
      hash[:ammunition] += inventory.ammunition
      hash
    end
  end

  def calculate_percentage(resource)
    number_people = people.count.to_f
    return 0 if number_people.zero?

    resource / number_people
  end

  def default_hash
    { water: 0, food: 0, medication: 0, ammunition: 0 }
  end
end
