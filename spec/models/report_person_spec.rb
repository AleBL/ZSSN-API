require "rails_helper"

RSpec.describe ReportPerson, type: :model do
  context "Valid Report" do
    let(:person_to)   { create(:person_with_inventory) }
    let(:person_from) { create(:person_with_inventory) }
    
    it "It is a valid report" do
      report = ReportPerson.new(:report_to => person_to, :report_from => person_from)
      expect(report.valid?).to be_truthy
    end
  end

  context "Invalid Report" do
    let(:person_to)   { create(:person_with_inventory) }
    let(:person_from) { create(:person_with_inventory) }

    it "It is not a valid report, person_to is nil" do
      person_to = nil
      report = ReportPerson.new(:report_to => person_to, :report_from => person_from)

      expect(report.valid?).to be_falsy
    end

    it "It is not a valid report, person_from is nil" do
      person_from = nil
      report = ReportPerson.new(:report_to => person_to, :report_from => person_from)

      expect(report.valid?).to be_falsy
    end

    it "It is not a valid report, person to and from are the same" do
      report = ReportPerson.new(:report_to => person_from, :report_from => person_from)
      expect(report.valid?).to be_falsy
    end
  end
end
