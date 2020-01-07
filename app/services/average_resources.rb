class AverageResources
  attr_reader :people

  def initialize(params = {})
    @people ||= params.fetch(:people, Person.where(infected: false))
  end

  def average_items
    @total ||= average_water + average_food + average_medication + average_ammunition
  end

  def average_water
    total_resources[:water] / people.count.to_f
  end

  def average_food
    total_resources[:food] / people.count.to_f
  end

  def average_medication
    total_resources[:medication] / people.count.to_f
  end

  def average_ammunition
    total_resources[:ammunition] / people.count.to_f
  end

  private

  def total_resources
    return @total_resources if defined?(@total_resources)
    @total_resources = people.inject(default_hash) do |hash, person|
      inventory = Inventory.find(person.id)

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
