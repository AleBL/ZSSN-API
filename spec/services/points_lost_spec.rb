require 'rails_helper'

RSpec.describe PointsLost do
  describe "points lost" do
    let(:points_lost)   { PointsLost.new }
    let(:people_infected) { Person.where(infected: true) }

    context "valid results" do
      it "points lost total is valid" do
        points_lost_total = points_lost.total
        result_spec = PointsCalc.new(people: people_infected).total

        expect(points_lost_total).to eq(result_spec)
      end

      it "points lost water is valid" do
        points_lost_water = points_lost.water_points
        result_spec = PointsCalc.new(people: people_infected).water_points
        expect(points_lost_water).to eq(result_spec)
      end

      it "points lost food is valid" do
        points_lost_food = points_lost.food_points
        result_spec  = PointsCalc.new(people: people_infected).food_points
        expect(points_lost_food).to eq(result_spec)
      end

      it "points lost medication is valid" do
        points_lost_medication = points_lost.medication_points
        result_spec = PointsCalc.new(people: people_infected).medication_points
        expect(points_lost_medication).to eq(result_spec)
      end

      it "points lost ammunition is valid" do
        points_lost_ammunition = points_lost.ammunition_points
        result_spec = PointsCalc.new(people: people_infected).ammunition_points
        expect(points_lost_ammunition).to eq(result_spec)
      end

    end

    context "invalid results" do
      it "points lost total is invalid" do
        points_lost_total = points_lost.total
        result_not_spec = PointsCalc.new(people: people_infected).total - rand(1..99)

        expect(points_lost_total).to_not eq(result_not_spec)
      end
    end
  end
end