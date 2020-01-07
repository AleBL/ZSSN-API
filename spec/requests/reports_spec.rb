require "rails_helper"

RSpec.describe "Reports", type: :request do
  describe "GET /api/reports" do
    context "GET test" do
      it "get reports" do
        get "/api/reports"
        expect(response).to have_http_status(200)
      end
    end
  end
end
