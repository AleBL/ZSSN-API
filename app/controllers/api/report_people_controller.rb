module Api
  class ReportPeopleController < ApplicationController
    def create
      report_to   = Person.find(report_params["report_to"])
      report_from = Person.find(report_params["report_from"])

      report = ::ReportPeople.new(report_to:   report_to,
                                  report_from: report_from)

      if report.valid?
        report.verify_reports
        render json: {status: I18n.t('status.success'), message: I18n.t('person.report.valid')}, status: :ok
      else
        render json: {status: I18n.t('status.error'), message: I18n.t('person.report.invalid')}, status: :unprocessable_entity
      end
    end

    private
    def report_params
      params.permit(:report_to, :report_from)
    end

  end
end
