class ReportPerson < ApplicationRecord
  belongs_to :report_to, :class_name => 'Person'
  belongs_to :report_from, :class_name => 'Person'

  validates_uniqueness_of :report_to, scoped: :report_from
  validate :check_report_equal

  def check_report_equal
    errors.add(:report_from, "can't be the same as report") if report_to == report_from
  end
end
