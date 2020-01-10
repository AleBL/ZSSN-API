require "rails_helper"

RSpec.describe PeopleCreator do
  describe "people creator" do
    context "#created? true" do
      let(:person_params_valid) {{
        person: {
          name: FFaker::NameBR.name,
          age: FFaker::Random.rand(1..99),
          local: FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s,
          gender: FFaker::GenderBR.maybe
        },
        inventory: {
          water: FFaker::Random.rand(1..99),
          food: FFaker::Random.rand(1..99),
          medication: FFaker::Random.rand(1..99),
          ammunition: FFaker::Random.rand(1..99)
        }
      }}

      it "person created successfully" do
        people_creator = PeopleCreator.new(create_person_params: person_params_valid)
        expect(people_creator.created?).to be_truthy
      end
    end
    
    context "#created? false" do
      let(:person_params_without_name) {{
        person: {
          age: FFaker::Random.rand(1..99),
          local: FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s,
          gender: FFaker::GenderBR.maybe
        },
        inventory: {
          water: FFaker::Random.rand(1..99),
          food: FFaker::Random.rand(1..99),
          medication: FFaker::Random.rand(1..99),
          ammunition: FFaker::Random.rand(1..99)
        }
      }}

      it "error, person without name" do
        people_creator = PeopleCreator.new(create_person_params: person_params_without_name)
        expect(people_creator.created?).to be_falsey
      end

      let(:person_params_without_inventory) {{
        person: {
          name: FFaker::NameBR.name,
          age: FFaker::Random.rand(1..99),
          local: FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s,
          gender: FFaker::GenderBR.maybe
        }
      }}

      it "error, person without inventory" do
        people_creator = PeopleCreator.new(create_person_params: person_params_without_inventory)
        expect(people_creator.created?).to be_falsey
      end
    end
  end
end
