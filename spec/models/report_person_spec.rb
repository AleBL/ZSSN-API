require 'rails_helper'

RSpec.describe ReportPerson, type: :model do
  describe 'validations' do
    it { should belong_to(:report_to) }
    it { should belong_to(:report_from) }
  end

  let(:person_to)   { create(:person_with_inventory) }
  let(:person_from) { create(:person_with_inventory) }

  context 'Valid Report' do
    it 'It is a valid report' do
      report = ReportPerson.new(report_to: person_to, report_from: person_from)
      expect(report.valid?).to be_truthy
    end
  end

  context 'Invalid Report' do
    it 'It is not a valid report, person_to is nil' do
      report = ReportPerson.new(report_to: nil, report_from: person_from)

      expect(report.valid?).to be_falsy
    end

    it 'It is not a valid report, person_from is nil' do
      report = ReportPerson.new(report_to: person_to, report_from: nil)

      expect(report.valid?).to be_falsy
    end

    it 'It is not a valid report, person to and from are the same' do
      report = ReportPerson.new(report_to: person_from, report_from: person_from)
      expect(report.valid?).to be_falsy
    end

    it 'It is not a valid report, already exists' do
      ReportPerson.new(report_to: person_to, report_from: person_from).save

      report = ReportPerson.new(report_to: person_to, report_from: person_from)
      expect(report.valid?).to be_falsy
    end
  end
end
