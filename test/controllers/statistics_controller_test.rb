require "test_helper"

class StatisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @statistic = statistics(:one)
  end

  test "should create statistic" do
    sign_in users(:one)
    assert_difference("Statistic.count") do
      post statistic_url, params: {
        statistic: {
          location: @statistic.location,
          offer_id: @statistic.offer_id,
          stat_type: @statistic.stat_type
        }
      },
      xhr: true
    end

    assert_response :created
  end
end
