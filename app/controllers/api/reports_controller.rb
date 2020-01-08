module Api
  class ReportsController < ApplicationController
    def index
      percentage_non_infected = ::PercentageNonInfected.new

      percentage_infected = ::PercentageInfected.new

      average_resources = ::AverageResources.new

      average_inventory = {
        average_water:      average_resources.average_water.round(2),
        average_food:       average_resources.average_food.round(2),
        average_medication: average_resources.average_medication.round(2),
        average_ammunition: average_resources.average_ammunition.round(2),
        average_total:      average_resources.average_items.round(2)
      }

      lost_points = ::PointsLost.new

      lost_points_items = {
        water:      lost_points.water_points,
        food:       lost_points.food_points,
        medication: lost_points.medication_points,
        ammunition: lost_points.ammunition_points,
        total:      lost_points.total
      }

      reports = {
        percentage_non_infected: "#{percentage_non_infected.percentage}%",
        percentage_infected: "#{percentage_infected.percentage}%",
        average_items_non_infected: average_inventory,
        lost_points: lost_points_items
      }
      render json: {status: 'SUCCESS', message: 'Reports', data: reports}, status: :ok
    end
  end
end
