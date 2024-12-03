require 'rails_helper'

RSpec.describe 'Reports' do
  describe 'GET /api/reports' do
    context 'when fetching all the reports' do
      it 'get reports with status code 200' do
        get '/api/reports'
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
