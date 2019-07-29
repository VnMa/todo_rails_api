require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "POST #create with no email / password params" do
    before do
      post :create
    end

    it "return 401 error status" do
      expect(response).to have_http_status(401)
    end
  end

  describe "POST #create with valid email / password params" do
    before do
      post :create, :params => {:email => 'anvo@gmail', :password => '123456'}
    end

    it "return 401 error status" do
      expect(response).to have_http_status(401)
    end
  end
end
