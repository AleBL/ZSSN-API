require 'rails_helper'

RSpec.describe PercentageInfected do
  describe 'average resources' do
    let!(:people_infected)     { create_list(:person_with_inventory, 5, infected: true) }
    let!(:people_non_infected) { create_list(:person_with_inventory, 10)                }
    let!(:number_people)       { Person.count.to_f                                      }
    let!(:percentage_infected) { described_class.new }

    context 'with valid attributes' do
      it 'expected percentage people infected' do
        percentage  = percentage_infected.percentage
        result_spec = ((people_infected.count / number_people) * 100).round(2)

        expect(percentage).to eq(result_spec)
      end
    end

    context 'with invalid attributes' do
      it 'unexpected percentage people infected' do
        percentage  = percentage_infected.percentage
        result_spec = ((people_non_infected.count / number_people) * 100).round(2)

        expect(percentage).not_to eq(result_spec)
      end
    end
  end
end
