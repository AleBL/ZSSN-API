require "rails_helper"

RSpec.describe "People", type: :request do
  describe "GET /api/people" do
    context "GET test" do
      it "get people" do
        get "/api/people"
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /api/people/:id" do
    context "GET test id" do
      it "get people by id" do
        get "/api/people/" + Person.last.id.to_s
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /api/people" do
    context "POST with valid attributes" do
      it "create a new person" do
        create_person_attributes = JSON[
          '{
            "person": {
              "name": "' + FFaker::NameBR.name + '",
              "age":   ' + FFaker::Random.rand(1..99).to_s + ',
              "gender":"'+ FFaker::GenderBR.maybe + '",
              "local": "'+ (FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s) + '"
              
            },
            "inventory": {
              "water":      ' + FFaker::Random.rand(1..99).to_s + ',
              "food":       ' + FFaker::Random.rand(1..99).to_s + ',
              "medication": ' + FFaker::Random.rand(1..99).to_s + ',
              "ammunition": ' + FFaker::Random.rand(1..99).to_s + '
            }
          }'
        ]

        expect{
          post "/api/people", params: create_person_attributes
        }.to change(Person, :count).by(1)
      end
    end
  end

  describe "POST /api/people" do
    context "POST with invalid inventory" do
      let(:invalid_attributes) { { name: "" } }

      it "does not create a new person" do
        expect {
          post "/api/people", params: invalid_attributes
        }.not_to change(Person, :count)
      end
    end
  end

  describe "POST /api/people" do
    context "POST with invalid attributes" do
      invalid_attributes = JSON[
        '{
          "person": {
            "age":   ' + FFaker::Random.rand(1..99).to_s + ',
            "gender":"'+ FFaker::GenderBR.maybe + '",
            "local": "'+ (FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s) + '"
            
          },
          "inventory": {
            "water":      ' + FFaker::Random.rand(1..99).to_s + ',
            "food":       ' + FFaker::Random.rand(1..99).to_s + ',
            "medication": ' + FFaker::Random.rand(1..99).to_s + ',
            "ammunition": ' + FFaker::Random.rand(1..99).to_s + '
          }
        }'
      ]

      it "does not create a new person" do
        expect {
          post "/api/people", params: invalid_attributes
        }.not_to change(Person, :count)
      end
    end
  end


end
