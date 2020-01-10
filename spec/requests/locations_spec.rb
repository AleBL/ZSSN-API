require "rails_helper"

RSpec.describe "Locations", type: :request do
  describe "PUT /api/locations" do
    context "valid attributes" do
      let(:person) { create(:person_with_inventory) }

      it "update location successfully" do
        update_location_params = {
          local: FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s
        }

        put "/api/locations/" + person.id.to_s, params: update_location_params
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "PUT /api/locations" do
    context "invalid attributes passed as a parameter" do
      let(:person) { create(:person_with_inventory) }

      it "latitude is valid" do
        invalid_update_location_params = {
          local: FFaker::Name.name + ", " + FFaker::Geolocation.lng.to_s
        }

        put "/api/locations/"+ person.id.to_s, params: invalid_update_location_params
        expect(response).to have_http_status(422)
      end

      it "longitude is invalid" do
        invalid_update_location_params = {
          local: FFaker::Geolocation.lat.to_s + ", " + FFaker::Name.name
        }

        put "/api/locations/"+ person.id.to_s, params: invalid_update_location_params
        expect(response).to have_http_status(422)
      end
    end
  end

end
