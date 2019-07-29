require 'rails_helper'

RSpec.describe V1::TodosController, type: :controller do
  describe "GET #index with no jwt token" do
    before do
      get :index
    end

    it "returns  401 error code" do
      expect(response).to have_http_status(401)
    end
  end
end
