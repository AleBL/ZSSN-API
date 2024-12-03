require 'rails_helper'

RSpec.describe 'People' do
  describe 'GET /api/people' do
    let!(:person) { create(:person_with_inventory) }

    context 'when getting people successfully' do
      it 'get people with status code 200' do
        get '/api/people'
        expect(response).to have_http_status(:ok)
      end

      it 'get people by id with status code 200' do
        get "/api/people/#{person.id}"
        expect(response).to have_http_status(:ok)
      end

      it 'get people by id with status code 404' do
        get '/api/people/0'
        expect(response).to have_http_status(:not_found)
      end

      context 'when locale is sending' do
        it 'get people with status code 200' do
          get '/api/people?locale=en'
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end

  describe 'POST /api/people' do
    context 'with valid attributes' do
      let(:params_valid_create_person) do
        {
          person: attributes_for(:person),
          inventory: attributes_for(:inventory)
        }
      end

      it 'create a new person successfully' do
        expect do
          post '/api/people', params: params_valid_create_person
        end.to change(Person, :count).by(1)
      end
    end

    context 'when a new person is not created' do
      context 'with invalid person attributes' do
        let(:params_invalid_create_person) do
          {
            inventory: attributes_for(:inventory)
          }
        end

        it 'name is invalid' do
          params_invalid_create_person.merge!({ person: attributes_for(:person, name: nil) })

          expect do
            post '/api/people', params: params_invalid_create_person
          end.not_to change(Person, :count)
        end

        it 'local is invalid' do
          params_invalid_create_person.merge!({ person: attributes_for(:person, local: nil) })

          expect do
            post '/api/people', params: params_invalid_create_person
          end.not_to change(Person, :count)
        end
      end

      context 'with invalid inventory attributes' do
        let(:params_invalid_create_person) do
          {
            person: attributes_for(:person)
          }
        end

        it 'water is invalid' do
          params_invalid_create_person.merge!({ inventory: attributes_for(:inventory, water: nil) })

          expect do
            post '/api/people', params: params_invalid_create_person
          end.not_to change(Person, :count)
        end

        it 'food is invalid' do
          params_invalid_create_person.merge!({ inventory: attributes_for(:inventory, food: nil) })

          expect do
            post '/api/people', params: params_invalid_create_person
          end.not_to change(Person, :count)
        end

        it 'medication is invalid' do
          params_invalid_create_person.merge!({ inventory: attributes_for(:inventory, medication: nil) })

          expect do
            post '/api/people', params: params_invalid_create_person
          end.not_to change(Person, :count)
        end

        it 'ammunition is invalid' do
          params_invalid_create_person.merge!({ inventory: attributes_for(:inventory, ammunition: nil) })

          expect do
            post '/api/people', params: params_invalid_create_person
          end.not_to change(Person, :count)
        end

        it 'all inventory is invalid' do
          expect do
            post '/api/people', params: params_invalid_create_person
          end.not_to change(Person, :count)
        end
      end
    end
  end
end
