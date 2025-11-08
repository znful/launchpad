require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "signed in user with admin rights should get index" do
    sign_in users(:one)
    get admin_dashboard_url
    assert_response :success
  end
end
