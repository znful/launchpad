require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "signed in user with admin rights should get index" do
    sign_in users(:one)
    get admin_dashboard_url
    assert_response :success
  end

  test "signed in user without admin rights should be redirected from index" do
    sign_in users(:two)
    get admin_dashboard_url
    assert_redirected_to offers_url
    assert_equal "You are not authorized to access this page.", flash[:alert]
  end

  test "unauthenticated user should be redirected from index" do
    get admin_dashboard_url
    assert_redirected_to new_session_url
  end
end
