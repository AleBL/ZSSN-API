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
      xit "get people by id" do
        get "/api/people/" + Person.last.id.to_s
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /api/people" do
    context "POST with valid attributes" do
      xit "create a new person" do
        person_attributes = FactoryBot.attributes_for(:person)
        expect{
          post "/api/people", params: person_attributes
        }.to change(Person, :count).by(1)
      end
    end
  end

  describe "POST /api/people" do
    context "POST with invalid attributes" do
      let(:invalid_attributes) { { name: "" } }

      it "does not create a new person" do
        expect {
          post "/api/people", params: invalid_attributes
        }.not_to change(Person, :count)
      end
    end
  end


end
