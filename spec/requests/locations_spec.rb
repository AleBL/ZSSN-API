require 'rails_helper'

RSpec.describe 'Locations' do
  describe 'PUT /api/locations' do
    context 'with valid attributes' do
      let(:person) { create(:person_with_inventory) }

      it 'update location successfully' do
        update_location_params = {
          local: "#{FFaker::Geolocation.lat}, #{FFaker::Geolocation.lng}"
        }

        put "/api/locations/#{person.id}", params: update_location_params
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid attributes passed as a parameter' do
      let(:person) { create(:person_with_inventory) }

      it 'latitude is valid' do
        invalid_update_location_params = {
          local: "#{FFaker::Name.name}, #{FFaker::Geolocation.lng}"
        }

        put "/api/locations/#{person.id}", params: invalid_update_location_params
        expect(response).to have_http_status(:unprocessable_content)
      end

      it 'longitude is invalid' do
        invalid_update_location_params = {
          local: "#{FFaker::Geolocation.lat}, #{FFaker::Name.name}"
        }

        put "/api/locations/#{person.id}", params: invalid_update_location_params
        expect(response).to have_http_status(:unprocessable_content)
      end

      it 'person id is invalid' do
        update_location_params = {
          local: "#{FFaker::Geolocation.lat}, #{FFaker::Geolocation.lng}"
        }

        put '/api/locations/0', params: update_location_params
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
