require "rails_helper"

RSpec.describe "People", type: :request do
  describe "GET /api/people" do
    context "get people successfully" do
      let(:person)  { create(:person_with_inventory) }

      it "get people with status code 200" do
        get "/api/people"
        expect(response).to have_http_status(200)
      end

      it "get people by id with status code 200" do
        get "/api/people/#{person.id}"
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST /api/people" do
    context "create a new person successfully" do
      let(:params_valid_create_person)  {{
        person:    attributes_for(:person),
        inventory: attributes_for(:inventory)
      }}

      it "valid attributes" do
        expect{
          post "/api/people", params: params_valid_create_person
        }.to change(Person, :count).by(1)
      end
    end

    context "does not create a new person" do
      context "invalid inventory attributes" do
        let(:params_invalid_create_person)  {{
          person: attributes_for(:person)
        }}

        it "invalid inventory" do
          expect {
            post "/api/people", params: params_invalid_create_person
          }.not_to change(Person, :count)
        end
      end

      context "invalid person attributes" do
        let(:params_invalid_create_person) {{
          inventory: attributes_for(:inventory)
        }}

        it "invalid attributes" do
          expect {
            post "/api/people", params: params_invalid_create_person
          }.not_to change(Person, :count)
        end
      end
    end
  end
end
