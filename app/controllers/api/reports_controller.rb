module Api
  class ReportsController < ApplicationController
    def index
      reports = {
        percentage_non_infected: calculate_percentage(::PercentageNonInfected.new),
        percentage_infected: calculate_percentage(::PercentageInfected.new),
        average_items_non_infected: calculate_average_inventory,
        lost_points: calculate_lost_points
      }

      render_success(t('status.success'), reports)
    end

    private

    def calculate_percentage(metric)
      "#{metric.percentage}%"
    end

    def calculate_average_inventory
      ::AverageResources.new.average_inventory
    end

    def calculate_lost_points
      ::PointsLost.new.lost_points_items
    end
  end
end
