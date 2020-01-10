require "rails_helper"

RSpec.describe AverageResources do
  describe "average resources" do
    let(:average_resources)   { AverageResources.new }
    let(:people_not_infected) { Person.where(infected: false) }
    let(:inventories_people)  {
      people_not_infected.inject({ water: 0, food: 0, medication: 0, ammunition: 0 }) do |hash, person|
        inventory = Inventory.find(person.inventory_id)
  
        hash[:water]      += inventory.water
        hash[:food]       += inventory.food
        hash[:medication] += inventory.medication
        hash[:ammunition] += inventory.ammunition
        hash
      end
    }

    context "valid attributes" do
      it "expected average items is valid" do
        average_items = average_resources.average_items
        result_spec = (inventories_people[:water] / people_not_infected.count.to_f) +
                      (inventories_people[:food] / people_not_infected.count.to_f) +
                      (inventories_people[:medication] / people_not_infected.count.to_f) +
                      (inventories_people[:ammunition] / people_not_infected.count.to_f)
        expect(average_items).to eq(result_spec)
      end

      it "expected average water" do
        average_water = average_resources.average_water
        result_spec =  (inventories_people[:water] / people_not_infected.count.to_f)
        expect(average_water).to eq(result_spec)
      end

      it "expected average food" do
        average_food = average_resources.average_food
        result_spec  = inventories_people[:food] / people_not_infected.count.to_f
        expect(average_food).to eq(result_spec)
      end

      it "expected average medication" do
        average_medication = average_resources.average_medication
        result_spec = inventories_people[:medication] / people_not_infected.count.to_f
        expect(average_medication).to eq(result_spec)
      end

      it "expected average ammunition" do
        average_ammunition = average_resources.average_ammunition
        result_spec = inventories_people[:ammunition] / people_not_infected.count.to_f
        expect(average_ammunition).to eq(result_spec)
      end

    end

    context "invalid attributes" do
      it "unexpected total" do
        average_items = average_resources.average_items
        result_spec = (inventories_people[:water] / people_not_infected.count.to_f) +
                      (inventories_people[:food] / people_not_infected.count.to_f) +
                      (inventories_people[:medication] / people_not_infected.count.to_f)
        expect(average_items).to_not eq(result_spec)
      end
    end
  end
end