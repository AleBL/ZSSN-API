require "rails_helper"

RSpec.describe ReportPeople do
  describe "report survivors" do
    let(:person_to)   { create(:person_with_inventory) }
    let(:person_from) { create(:person_with_inventory) }

    context "#valid? true" do
      it "report with valid attributes" do
        report_survivor = ReportPeople.new(report_to: person_to, report_from: person_from)
        expect(report_survivor.valid?).to be_truthy
      end

      it "three valid reports" do
        second_person_to = create(:person_with_inventory)
        third_person_to  = create(:person_with_inventory)

        ReportPeople.new(report_to: second_person_to, report_from: person_from).valid?
        ReportPeople.new(report_to: third_person_to, report_from: person_from).valid?

        report_survivor = ReportPeople.new(report_to: person_to, report_from: person_from)
        report_survivor.valid?
        report_survivor.verify_reports

        expect(person_from.infected?).to be_truthy
      end
    end

    context "#valid? false" do
      it "report with invalid attributes, person to and from are the same" do
        report_survivor = ReportPeople.new(report_to: person_to, report_from: person_to)
        expect(report_survivor.valid?).to be_falsey
      end
    end
  end
end
