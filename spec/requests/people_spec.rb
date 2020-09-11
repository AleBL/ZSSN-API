require "rails_helper"

RSpec.describe "People", type: :request do
  describe "GET /api/people" do
    let!(:person)  { create(:person_with_inventory) }
  
    context "get people successfully" do
      it "get people with status code 200" do
        get "/api/people"
        expect(response).to have_http_status(200)
      end

      it "get people by id with status code 200" do
        get "/api/people/#{person.id}"
        expect(response).to have_http_status(200)
      end

      it "get people by id with status code 404" do 
        get "/api/people/0" 
        expect(response).to have_http_status(404) 
      end
    end
  end

  describe "POST /api/people" do
    context "valid attributes" do
      let(:params_valid_create_person)  {{
        person:    attributes_for(:person),
        inventory: attributes_for(:inventory)
      }}

      it "create a new person successfully" do
        expect{
          post "/api/people", params: params_valid_create_person
        }.to change(Person, :count).by(1)
      end
    end

    context "does not create a new person" do
      context "invalid person attributes" do
        let(:params_invalid_create_person) {{
          inventory: attributes_for(:inventory)
        }}
  
        it "name is invalid" do
          params_invalid_create_person.merge!({ person: attributes_for(:person, name: nil) })

          expect {
            post "/api/people", params: params_invalid_create_person
          }.not_to change(Person, :count)
        end

        it "local is invalid" do
          params_invalid_create_person.merge!({ person: attributes_for(:person, local: nil) })

          expect {
            post "/api/people", params: params_invalid_create_person
          }.not_to change(Person, :count)
        end
      end

      context "invalid inventory attributes" do
        let(:params_invalid_create_person)  {{
          person: attributes_for(:person)
        }}

        it "water is invalid" do
          params_invalid_create_person.merge!({ inventory: attributes_for(:inventory, water: nil) })

          expect {
            post "/api/people", params: params_invalid_create_person
          }.not_to change(Person, :count)
        end

        it "food is invalid" do
          params_invalid_create_person.merge!({ inventory: attributes_for(:inventory, food: nil) })

          expect {
            post "/api/people", params: params_invalid_create_person
          }.not_to change(Person, :count)
        end

        it "medication is invalid" do
          params_invalid_create_person.merge!({ inventory: attributes_for(:inventory, medication: nil) })

          expect {
            post "/api/people", params: params_invalid_create_person
          }.not_to change(Person, :count)
        end

        it "ammunition is invalid" do
          params_invalid_create_person.merge!({ inventory: attributes_for(:inventory, ammunition: nil) })

          expect {
            post "/api/people", params: params_invalid_create_person
          }.not_to change(Person, :count)
        end

        it "all inventory is invalid" do
          expect {
            post "/api/people", params: params_invalid_create_person
          }.not_to change(Person, :count)
        end
      end
    end
  end

end
