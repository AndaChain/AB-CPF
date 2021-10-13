require "test_helper"

class InforControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get infor_index_url
    assert_response :success
  end
end
