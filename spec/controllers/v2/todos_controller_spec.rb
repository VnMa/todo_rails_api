require 'rails_helper'

RSpec.describe V2::TodosController, type: :controller do
  describe "GET #index with no jwt token" do
    let!(:todos) {
      Todo.create([{
        title: 'first todo',
        content: 'First content'
      }, {
        title: 'second todo',
        content: 'Second content'
      }])

    }

    before do
      get :index
    end

    it "returns  2xx success code" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected data format" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(['data'])
    end

    it "should return data result as an array with length of 2" do
      json_response = JSON.parse(response.body)
      expect(json_response['data'].size).to eq(2)
    end

    # it "JSON body response contains expected recipe attributes" do
    #   json_response = JSON.parse(response.body)
    #   p "json_response: #{json_response}"
    #   expect(hash_body.keys).to match_array([:user, :todos])
    # end
  end
end
