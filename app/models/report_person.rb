class ReportPerson < ApplicationRecord
  belongs_to :report_to, class_name: 'Person'
  belongs_to :report_from, class_name: 'Person'

  validate :check_report_exist
  validate :check_report_equal

  def check_report_equal
    return unless report_to == report_from

    errors.add(:report_from, I18n.t('person.report.not_same'))
  end

  def check_report_exist
    return unless ReportPerson.where(report_to: report_to, report_from: report_from).count.positive?

    errors.add(:report_from, I18n.t('person.report.exist'))
  end
end
