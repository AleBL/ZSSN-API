require "rails_helper"

RSpec.describe "Locations", type: :request do
  let(:person)    { build(:person) }
  let(:inventory) { create(:inventory) }

  describe "PUT /api/locations" do
    context "PUT with valid attributes" do
      it "update location" do
        person.inventory_id = inventory.id
        person.save

        update_location_params = {
          local: FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s
        }

        put "/api/locations/" + person.id.to_s, params: update_location_params
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "PUT /api/locations" do
    context "PUT with invalid location" do
      it "latitude is invalid" do
        person.inventory_id = inventory.id
        person.save

        invalid_update_location_params = {
          local: FFaker::Name.name + ", " + FFaker::Geolocation.lng.to_s
        }

        put "/api/locations/"+ person.id.to_s, params: invalid_update_location_params
        expect(response).to have_http_status(422)
      end

      it "longitude is invalid" do
        person.inventory_id = inventory.id
        person.save

        invalid_update_location_params = {
          local: FFaker::Geolocation.lat.to_s + ", " + FFaker::Name.name
        }

        put "/api/locations/"+ person.id.to_s, params: invalid_update_location_params
        expect(response).to have_http_status(422)
      end
    end
  end

end
