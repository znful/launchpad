require "application_system_test_case"

class StatisticsTest < ApplicationSystemTestCase
  setup do
    @statistic = statistics(:one)
  end

  test "visiting the index" do
    visit statistics_url
    assert_selector "h1", text: "Statistics"
  end

  test "should create statistic" do
    visit statistics_url
    click_on "New statistic"

    fill_in "Location", with: @statistic.location
    fill_in "Offer", with: @statistic.offer_id
    fill_in "Stat type", with: @statistic.stat_type
    click_on "Create Statistic"

    assert_text "Statistic was successfully created"
    click_on "Back"
  end

  test "should update Statistic" do
    visit statistic_url(@statistic)
    click_on "Edit this statistic", match: :first

    fill_in "Location", with: @statistic.location
    fill_in "Offer", with: @statistic.offer_id
    fill_in "Stat type", with: @statistic.stat_type
    click_on "Update Statistic"

    assert_text "Statistic was successfully updated"
    click_on "Back"
  end

  test "should destroy Statistic" do
    visit statistic_url(@statistic)
    click_on "Destroy this statistic", match: :first

    assert_text "Statistic was successfully destroyed"
  end
end
