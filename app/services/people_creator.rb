class PeopleCreator
  attr_reader :create_person_params

  def initialize(create_person_params:)
    @create_person_params = create_person_params
  end

  def created?
    inventory = Inventory.new(create_person_params[:inventory])
    return false unless inventory.save

    person = Person.new(create_person_params[:person])
    person.assign_attributes(infected: false, inventory: inventory)

    return true if person.save

    inventory.destroy
    false
  end
end
