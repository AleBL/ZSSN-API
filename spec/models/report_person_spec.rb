require "rails_helper"

RSpec.describe ReportPerson, type: :model do
  context "Valid Report" do
    it "It is a valid report" do
      person_to    = build(:person)
      inventory_to = create(:inventory)

      person_to.inventory_id = inventory_to.id
      person_to.save

      person_from    = build(:person)
      inventory_from = create(:inventory)

      person_from.inventory_id = inventory_from.id
      person_from.save

      report             = ReportPerson.new
      report.report_to   = person_to
      report.report_from = person_from

      expect(report.valid?).to be_truthy
    end
  end

  context "Invalid Report" do
    it "It is not a valid report, person_to is nil" do
      person_to      = nil
      person_from    = build(:person)
      inventory_from = create(:inventory)

      person_from.inventory_id = inventory_from.id
      person_from.save

      report             = ReportPerson.new
      report.report_to   = person_to
      report.report_from = person_from

      expect(report.valid?).to be_falsy
    end

    it "It is not a valid report, person_from is nil" do
      person_to              = build(:person)
      inventory_to           = create(:inventory)
      person_to.inventory_id = inventory_to.id
      person_to.save
      person_from            = nil

      report             = ReportPerson.new
      report.report_to   = person_to
      report.report_from = person_from

      expect(report.valid?).to be_falsy
    end
  end
end
