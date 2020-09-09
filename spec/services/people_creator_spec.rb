require "rails_helper"

RSpec.describe PeopleCreator do
  describe "people creator" do
    context "#created? true" do
      let(:person_params_valid)  {{
        person:    attributes_for(:person),
        inventory: attributes_for(:inventory)
      }}

      it "person created successfully" do
        people_creator = PeopleCreator.new(create_person_params: person_params_valid)
        expect(people_creator.created?).to be_truthy
      end
    end
    
    context "#created? false" do
      let(:person_params_without_name)  {{
        person:    attributes_for(:person, name: nil),
        inventory: attributes_for(:inventory)
      }}
      it "error, person without name" do
        people_creator = PeopleCreator.new(create_person_params: person_params_without_name)
        expect(people_creator.created?).to be_falsey
      end

      let(:person_params_without_inventory)  {{
        person: attributes_for(:person)
      }}
      it "error, person without inventory" do
        people_creator = PeopleCreator.new(create_person_params: person_params_without_inventory)
        expect(people_creator.created?).to be_falsey
      end
    end
  end
end
