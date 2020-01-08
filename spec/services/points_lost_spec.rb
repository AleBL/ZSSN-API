require 'rails_helper'

RSpec.describe PointsLost do
  describe "points lost" do
    let(:points_lost)   { PointsLost.new }
    let(:weights) {{ water: 4, food: 3, medication: 2, ammunition: 1 }}
    let(:people_infected) { Person.where(infected: true) }
    let(:inventories_people)  {
      people_infected.inject({ water: 0, food: 0, medication: 0, ammunition: 0 }) do |hash, person|
        inventory = Inventory.find(person.inventory_id)
  
        hash[:water]      += inventory.water
        hash[:food]       += inventory.food
        hash[:medication] += inventory.medication
        hash[:ammunition] += inventory.ammunition
        hash
      end
    }

    context "valid results" do
      it "points lost total is valid" do
        points_lost_total = points_lost.total
        result_spec = (inventories_people[:water] * weights[:water]) +
                      (inventories_people[:food] * weights[:food])  +
                      (inventories_people[:medication] * weights[:medication]) +
                      (inventories_people[:ammunition] * weights[:ammunition])

        expect(points_lost_total).to eq(result_spec)
      end

      it "points lost water is valid" do
        points_lost_water = points_lost.water_points
        result_spec =  inventories_people[:water] * weights[:water]
        expect(points_lost_water).to eq(result_spec)
      end

      it "points lost food is valid" do
        points_lost_food = points_lost.food_points
        result_spec  = inventories_people[:food] * weights[:food]
        expect(points_lost_food).to eq(result_spec)
      end

      it "points lost medication is valid" do
        points_lost_medication = points_lost.medication_points
        result_spec = inventories_people[:medication] * weights[:medication]
        expect(points_lost_medication).to eq(result_spec)
      end

      it "points lost ammunition is valid" do
        points_lost_ammunition = points_lost.ammunition_points
        result_spec = inventories_people[:ammunition] * weights[:ammunition]
        expect(points_lost_ammunition).to eq(result_spec)
      end

    end

    context "invalid results" do
      it "points lost total is invalid" do
        points_lost_total = points_lost.total
        result_spec = (inventories_people[:water] * weights[:water]) +
                      (inventories_people[:food] * weights[:food])  +
                      (inventories_people[:medication] * weights[:medication]) +
                      (inventories_people[:ammunition] * weights[:ammunition]) + 1

        expect(points_lost_total).to_not eq(result_spec)
      end
    end
  end
end