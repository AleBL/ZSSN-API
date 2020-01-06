require "rails_helper"

RSpec.describe "ReportPeople", type: :request do

    let(:person_to)      { build(:person) }
    let(:inventory_to)   { create(:inventory) }
    let(:person_from)    { build(:person) }
    let(:inventory_from) { create(:inventory) }  

    describe "POST /api/report_people" do
        context "POST with valid attributes" do
            it "create a new report person" do
                person_to.inventory_id = inventory_to.id
                person_to.save

                person_from.inventory_id = inventory_from.id
                person_from.save

                report_valid_params = {
                    report_to: person_to.id,
                    report_from: person_from.id 
                }

                expect{
                    post "/api/report_people", params: report_valid_params
                }.to change(ReportPerson, :count).by(1)
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
                
                report_valid_params = {
                    report_to: third_person_to.id,
                    report_from: person_from.id 
                }

                expect{
                    post "/api/report_people", params: report_valid_params
                }.to change(ReportPerson, :count).by(1)
              end
        end
    end

    describe "POST /api/report_people" do
        context "POST with invalid inventory" do
            it "does not create a new person" do
                person_to.inventory_id = inventory_to.id
                person_to.save

                report_invalid_params = {
                    report_to: person_to.id,
                    report_from: person_to.id 
                }

                expect {
                    post "/api/report_people", params: report_invalid_params
                }.not_to change(ReportPerson, :count)
            end
        end
    end
end
