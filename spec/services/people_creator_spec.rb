require 'rails_helper'

RSpec.describe PeopleCreator do
  describe 'people creator' do
    describe '#created? true' do
      let(:person_params_valid) do
        {
          person: attributes_for(:person),
          inventory: attributes_for(:inventory)
        }
      end

      it 'person created successfully' do
        people_creator = described_class.new(create_person_params: person_params_valid)
        expect(people_creator).to be_created
      end
    end

    describe '#created? false' do
      let(:person_params_without_name) do
        {
          person: attributes_for(:person, name: nil),
          inventory: attributes_for(:inventory)
        }
      end
      let(:person_params_without_inventory) do
        {
          person: attributes_for(:person)
        }
      end

      it 'error, person without name' do
        people_creator = described_class.new(create_person_params: person_params_without_name)
        expect(people_creator).not_to be_created
      end

      it 'error, person without inventory' do
        people_creator = described_class.new(create_person_params: person_params_without_inventory)
        expect(people_creator).not_to be_created
      end
    end
  end
end
