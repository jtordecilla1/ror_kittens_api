require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mock_img_id = 54715493202
  end
  
  test "should get index" do
    get search_url
    assert_response :success
  end

  test "should show photo" do
    get search_url(id: @mock_img_id)
    assert_response :success
  end
end