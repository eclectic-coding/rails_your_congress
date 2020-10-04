require 'rails_helper'

RSpec.describe "Representatives", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/representatives/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/representatives/show"
      expect(response).to have_http_status(:success)
    end
  end

end
