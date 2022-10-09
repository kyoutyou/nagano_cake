require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get items_controller" do
    get admin_items_controller_url
    assert_response :success
  end
end
