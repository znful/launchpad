require "test_helper"

class OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get offers_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_offer_url
    assert_response :success
  end

  test "should create offer" do
    sign_in users(:one)
    assert_difference("Offer.count") do
      post offers_url, params: {
        offer: {
          address: @offer.address,
          application_link: @offer.application_link,
          company_name: @offer.company_name,
          contract_type: @offer.contract_type,
          description: @offer.description,
          job_type: @offer.job_type,
          status: @offer.status,
          title: @offer.title,
          verification_status: @offer.verification_status,
          user_id: users(:one).id
        }
      }
    end

    assert_redirected_to dashboard_url
  end

  test "should show offer" do
    get offer_url(@offer)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_offer_url(@offer)
    assert_response :success
  end

  test "should update offer" do
    sign_in users(:one)
    patch offer_url(@offer), params: { offer: { address: @offer.address, application_link: @offer.application_link, company_name: @offer.company_name, contract_type: @offer.contract_type, description: @offer.description, job_type: @offer.job_type, status: @offer.status, title: @offer.title, verification_status: @offer.verification_status } }
    assert_redirected_to offer_url(@offer)
  end

  test "should destroy offer" do
    sign_in users(:one)
    assert_difference("Offer.count", -1) do
      delete offer_url(@offer)
    end

    assert_redirected_to dashboard_url
  end
end
