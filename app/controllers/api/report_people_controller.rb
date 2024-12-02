module Api
  class ReportPeopleController < ApplicationController
    def create
      report_to   = Person.find_by_id(report_params[:report_to])
      report_from = Person.find_by_id(report_params[:report_from])

      report = ::ReportPeople.new(report_to: report_to,
                                  report_from: report_from)

      if report.valid?
        render_success(t('person.report.valid'))
      else
        render_unprocessable_entity_error(t('person.report.invalid'))
      end
    end

    private

    def report_params
      params.permit(:report_to, :report_from)
    end
  end
end
