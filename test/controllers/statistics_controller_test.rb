require "test_helper"

class StatisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @statistic = statistics(:one)
  end

  test "should create statistic" do
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

  test "should not create statistic when user is owner of the offer" do
    sign_in users(:one)
    assert_no_difference("Statistic.count") do
      post statistic_url, params: {
        statistic: {
          location: @statistic.location,
          offer_id: @statistic.offer_id,
          stat_type: @statistic.stat_type
        }
      },
      xhr: true
    end

    assert_response :ok
  end
end
