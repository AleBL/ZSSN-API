require 'rails_helper'

RSpec.describe 'ReportPeople' do
  let(:person_to)   { create(:person_with_inventory) }
  let(:person_from) { create(:person_with_inventory) }

  describe 'POST /api/report_people' do
    context 'with valid attributes' do
      let(:report_valid_params) do
        {
          report_to: person_to.id,
          report_from: person_from.id
        }
      end

      it 'create a new report person' do
        expect do
          post '/api/report_people', params: report_valid_params
        end.to change(ReportPerson, :count).by(1)
      end

      it 'three valid reports' do
        second_person_to = create(:person_with_inventory)
        third_person_to  = create(:person_with_inventory)

        ReportPeople.new(report_to: second_person_to, report_from: person_from).valid?
        ReportPeople.new(report_to: third_person_to, report_from: person_from).valid?

        expect do
          post '/api/report_people', params: report_valid_params
        end.to change(ReportPerson, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:report_invalid_params) do
        {
          report_to: person_to.id,
          report_from: person_to.id
        }
      end

      it 'person to and from are the same' do
        expect do
          post '/api/report_people', params: report_invalid_params
        end.not_to change(ReportPerson, :count)
      end
    end
  end
end
