require 'rails_helper'

RSpec.describe AverageResources do
  describe 'average resources' do
    let!(:people_infected)     { create_list(:person_with_inventory, 5, infected: true) }
    let!(:people_non_infected) { create_list(:person_with_inventory, 10)                }
    let!(:number_non_infected) { people_non_infected.try(:count).to_f                   }
    let!(:average_resources)   { AverageResources.new                                   }
    let!(:inventories_people)  do
      people_non_infected.each_with_object({ water: 0, food: 0, medication: 0, ammunition: 0 }) do |person, hash|
        inventory = Inventory.find(person.inventory_id)

        hash[:water]      += inventory.water
        hash[:food]       += inventory.food
        hash[:medication] += inventory.medication
        hash[:ammunition] += inventory.ammunition
      end
    end

    context 'valid attributes' do
      it 'expected average items is valid' do
        average_items = average_resources.average_items
        result_spec = (inventories_people[:water]      / number_non_infected) +
                      (inventories_people[:food]       / number_non_infected) +
                      (inventories_people[:medication] / number_non_infected) +
                      (inventories_people[:ammunition] / number_non_infected)
        expect(average_items).to eq(result_spec)
      end

      it 'expected average water' do
        average_water = average_resources.average_water
        result_spec   = (inventories_people[:water] / number_non_infected)
        expect(average_water).to eq(result_spec)
      end

      it 'expected average food' do
        average_food = average_resources.average_food
        result_spec  = inventories_people[:food] / number_non_infected
        expect(average_food).to eq(result_spec)
      end

      it 'expected average medication' do
        average_medication = average_resources.average_medication
        result_spec        = inventories_people[:medication] / number_non_infected
        expect(average_medication).to eq(result_spec)
      end

      it 'expected average ammunition' do
        average_ammunition = average_resources.average_ammunition
        result_spec        = inventories_people[:ammunition] / number_non_infected
        expect(average_ammunition).to eq(result_spec)
      end
    end

    context 'invalid attributes' do
      it 'unexpected total' do
        average_items = average_resources.average_items
        result_spec   = (inventories_people[:water]      / number_non_infected) +
                        (inventories_people[:food]       / number_non_infected) +
                        (inventories_people[:medication] / number_non_infected)
        expect(average_items).to_not eq(result_spec)
      end
    end
  end
end
