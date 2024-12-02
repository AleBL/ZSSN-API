require 'rails_helper'

RSpec.describe 'Reports', type: :request do
  describe 'GET /api/reports' do
    context 'all the reports' do
      it 'get reports with status code 200' do
        get '/api/reports'
        expect(response).to have_http_status(200)
      end
    end
  end
end
