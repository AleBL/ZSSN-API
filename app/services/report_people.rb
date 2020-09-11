class ReportPeople
  attr_reader :report_to, :report_from

  def initialize(report_to:, report_from:)
    @report_to   = report_to
    @report_from = report_from
  end

  def valid?
    return false unless report_to && report_from
    return false if report_to.infected? || report_from.infected?

    report_not_infected
  end

  def report_not_infected
    report = ReportPerson.new(report_to: report_to, report_from: report_from)
    
    return false unless report.save
    
    verify_reports
    true
  end

  def verify_reports
    reports = ReportPerson.where(report_from: report_from)

    if(reports.length >= 3)
      report_from.update(infected: true)
    end
  end

end
