module Api
  class ReportPeopleController < ApplicationController
    def create
      report_to   = Person.find_by_id(report_params[:report_to])
      report_from = Person.find_by_id(report_params[:report_from])

      report = ::ReportPeople.new(report_to:   report_to,
                                  report_from: report_from)

      if report.valid?
        render json: { status: t('status.success'), message: t('person.report.valid') }, status: :ok
      else
        render json: { status: t('status.error'), message: t('person.report.invalid') }, status: :unprocessable_entity
      end
    end

    private
    def report_params
      params.permit(:report_to, :report_from)
    end

  end
end
