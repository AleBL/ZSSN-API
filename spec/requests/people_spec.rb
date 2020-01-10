require "rails_helper"

RSpec.describe "People", type: :request do
  describe "GET /api/people" do
    context "get people successfully" do
      it "get people with status code 200" do
        get "/api/people"
        expect(response).to have_http_status(200)
      end

      it "get people by id with status code 200" do
        get "/api/people/" + Person.last.id.to_s
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /api/people" do
    context "valid attributes" do
      let(:params_valid_create_person) {{
        person: {
            name:   FFaker::NameBR.name,
            age:    FFaker::Random.rand(1..99),
            gender: FFaker::GenderBR.maybe,
            local:  FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s
          },
          inventory:{
            water:      FFaker::Random.rand(1..99),
            food:       FFaker::Random.rand(1..99),
            medication: FFaker::Random.rand(1..99),
            ammunition: FFaker::Random.rand(1..99)
          }
      }}

      it "create a new person successfully" do
        expect{
          post "/api/people", params: params_valid_create_person
        }.to change(Person, :count).by(1)
      end
    end

    context "invalid inventory" do
      let(:params_invalid_create_person) {{
        person: {
            name:   FFaker::NameBR.name,
            age:    FFaker::Random.rand(1..99),
            gender: FFaker::GenderBR.maybe,
            local:  FFaker::Geolocation.lat.to_s + ", " + FFaker::Geolocation.lng.to_s
          },
          inventory:{
            water:      FFaker::Random.rand(1..99),
            food:       FFaker::Random.rand(1..99)
          }
      }}

      it "does not create a new person" do
        expect {
          post "/api/people", params: params_invalid_create_person
        }.not_to change(Person, :count)
      end
    end

    context "invalid attributes" do
      let(:params_invalid_create_person) {{
        person: {
            age:    FFaker::Random.rand(1..99),
            gender: FFaker::GenderBR.maybe
          },
          inventory:{
            water:      FFaker::Random.rand(1..99),
            food:       FFaker::Random.rand(1..99),
            medication: FFaker::Random.rand(1..99),
            ammunition: FFaker::Random.rand(1..99)
          }
      }}

      it "does not create a new person" do
        expect {
          post "/api/people", params: params_invalid_create_person
        }.not_to change(Person, :count)
      end
    end
  end

end
