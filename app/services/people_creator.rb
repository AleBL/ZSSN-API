class PeopleCreator
  attr_reader :create_person_params

  def initialize(create_person_params:)
    @create_person_params = create_person_params
  end

  def created?
    inventory = Inventory.new(create_person_params[:inventory])
    return false unless inventory.save

    person = Person.new(create_person_params[:person])
    person.infected = false
    person.inventory_id = inventory.id
    
    if person.save
      true
    else
      inventory.destroy
      false
    end
  end
end
