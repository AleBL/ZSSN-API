class ReportPerson < ApplicationRecord
  belongs_to :report_to, :class_name => 'Person'
  belongs_to :report_from, :class_name => 'Person'

  validate :check_report_exist
  validate :check_report_equal

  def check_report_equal
    errors.add(:report_from, I18n.t('person.report.not_same')) if report_to == report_from
  end

  def check_report_exist
    errors.add(:report_from, I18n.t('person.report.exist')) if ReportPerson.where(report_to: report_to, report_from: report_from).count > 0
  end
end
