require 'rails_helper'

RSpec.describe PointsLost do
  describe 'points lost' do
    let!(:people_infected)     { create_list(:person_with_inventory, 5, infected: true) }
    let!(:people_non_infected) { create_list(:person_with_inventory, 10)                }
    let!(:points_lost)         { PointsLost.new                                         }

    context 'valid attributes' do
      it 'expected points lost total' do
        points_lost_total = points_lost.total
        result_spec = PointsCalc.new(people: people_infected).total

        expect(points_lost_total).to eq(result_spec)
      end

      it 'expected points lost water' do
        points_lost_water = points_lost.water_points
        result_spec = PointsCalc.new(people: people_infected).water_points
        expect(points_lost_water).to eq(result_spec)
      end

      it 'expected points lost food' do
        points_lost_food = points_lost.food_points
        result_spec = PointsCalc.new(people: people_infected).food_points
        expect(points_lost_food).to eq(result_spec)
      end

      it 'expected points lost medication' do
        points_lost_medication = points_lost.medication_points
        result_spec = PointsCalc.new(people: people_infected).medication_points
        expect(points_lost_medication).to eq(result_spec)
      end

      it 'expected points lost ammunition' do
        points_lost_ammunition = points_lost.ammunition_points
        result_spec = PointsCalc.new(people: people_infected).ammunition_points
        expect(points_lost_ammunition).to eq(result_spec)
      end
    end

    context 'invalid attributes' do
      it 'unexpected points lost total' do
        points_lost_total = points_lost.total
        result_not_spec = PointsCalc.new(people: people_non_infected).total

        expect(points_lost_total).to_not eq(result_not_spec)
      end
    end
  end
end
