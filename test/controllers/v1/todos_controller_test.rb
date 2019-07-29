require 'test_helper'

class V1::TodosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todos_index_url
    assert_response :success
  end

  test "should get create" do
    get todos_create_url
    assert_response :success
  end

end
