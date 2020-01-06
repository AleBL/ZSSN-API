require 'rails_helper'

RSpec.describe ReportPeople do
  describe "report survivors" do
    let(:person_to)      { build(:person) }
    let(:inventory_to)   { create(:inventory) }
    let(:person_from)    { build(:person) }
    let(:inventory_from) { create(:inventory) }

    context "#valid? true" do
      it "valid report" do
        person_to.inventory_id = inventory_to.id
        person_to.save

        person_from.inventory_id = inventory_from.id
        person_from.save

        report_survivor = ReportPeople.new(report_to: person_to, report_from: person_from)
        expect(report_survivor.valid?).to be_truthy
      end

      it "three valid reports" do
        person_to.inventory_id = inventory_to.id
        person_to.save

        second_person_to = build(:person)
        second_inventory_to = create(:inventory)
        second_person_to.inventory_id = second_inventory_to.id
        second_person_to.save

        third_person_to = build(:person)
        third_inventory_to = create(:inventory)
        third_person_to.inventory_id = third_inventory_to.id
        third_person_to.save

        person_from.inventory_id = inventory_from.id
        person_from.save

        ReportPeople.new(report_to: person_to, report_from: person_from).valid?
        ReportPeople.new(report_to: second_person_to, report_from: person_from).valid?
        report_survivor = ReportPeople.new(report_to: third_person_to, report_from: person_from)
        report_survivor.valid?
        report_survivor.verify_reports

        expect(person_from.infected?).to be_truthy
      end
    end

    context "#valid? false" do
      it "person to and from are the same" do
        person_to.inventory_id = inventory_to.id
        person_to.save

        report_survivor = ReportPeople.new(report_to: person_to, report_from: person_to)
        expect(report_survivor.valid?).to be_falsey
      end
    end
  end
end
