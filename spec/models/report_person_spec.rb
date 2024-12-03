require 'rails_helper'

RSpec.describe ReportPerson do
  let(:person_from) { create(:person_with_inventory) }
  let(:person_to)   { create(:person_with_inventory) }

  describe 'validations' do
    it { is_expected.to belong_to(:report_to) }
    it { is_expected.to belong_to(:report_from) }
  end

  context 'when the report is valid' do
    it 'is a valid report' do
      report = described_class.new(report_to: person_to, report_from: person_from)
      expect(report).to be_valid
    end
  end

  context 'when the report is invalid' do
    it 'is not a valid report, person_to is nil' do
      report = described_class.new(report_to: nil, report_from: person_from)

      expect(report).not_to be_valid
    end

    it 'is not a valid report, person_from is nil' do
      report = described_class.new(report_to: person_to, report_from: nil)

      expect(report).not_to be_valid
    end

    it 'is not a valid report, person to and from are the same' do
      report = described_class.new(report_to: person_from, report_from: person_from)
      expect(report).not_to be_valid
    end

    it 'is not a valid report, already exists' do
      described_class.new(report_to: person_to, report_from: person_from).save

      report = described_class.new(report_to: person_to, report_from: person_from)
      expect(report).not_to be_valid
    end
  end
end
