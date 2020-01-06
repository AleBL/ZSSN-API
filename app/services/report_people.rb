class ReportPeople
  attr_reader :report_to, :report_from

  def initialize(report_to:, report_from:)
    @report_to   = report_to
    @report_from = report_from
  end

  def valid?
    false if report_to.infected? || report_from.infected?

    report_not_infected
  end

  def report_not_infected
    report             = ReportPerson.new()
    report.report_to   = report_to
    report.report_from = report_from

    report.save
  end

  def verify_reports
    reports = ReportPerson.where(report_from: report_from.id)
    if(reports.length >= 3)
      report_from.update_attributes({"infected":true})
    end
  end

end
