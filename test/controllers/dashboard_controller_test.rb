require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in users(:one)
    get dashboard_url
    assert_response :success
  end
end
