require 'rails_helper'

RSpec.describe "Senators", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/senators/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/senators/show"
      expect(response).to have_http_status(:success)
    end
  end

end
