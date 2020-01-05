module Api
  class ReportController < ApplicationController
    def index

      render json: {status: 'SUCCESS'}, status: :ok
    end
  end
end
