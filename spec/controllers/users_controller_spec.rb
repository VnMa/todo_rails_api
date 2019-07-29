require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "Count mock users" do
    before do
      get :index
    end

    it "return successful response" do
      expect(response).to have_http_status(:success)
    end

    it "total users count should equals to 0" do
      expect(JSON.parse(response.body)['total']).to eq 0
    end
  end
end
