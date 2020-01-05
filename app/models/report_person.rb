class ReportPerson < ApplicationRecord
  belongs_to :report_to, :class_name => 'Person'
  belongs_to :report_from, :class_name => 'Person'
end
