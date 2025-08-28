require "test_helper"

class OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer = offers(:one)
    @offer.geocode
  end

  test "should get index" do
    get offers_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(users(:one))
    get new_offer_url
    assert_response :success
  end

  test "should create offer" do
    sign_in_as(users(:one))
    assert_difference("Offer.count") do
      post offers_url, params: {
        offer: {
          apply_link: Faker::Internet.url,
          city: Faker::Address.city,
          company_name: Faker::Company.name,
          contract_type: Offer.contract_types.keys.sample,
          country: Faker::Address.country,
          description: Faker::Lorem.paragraph,
          job_type: Offer.job_types.keys.sample,
          title: Faker::Job.title,
          user_id: users(:one).id
        }
      }
    end
    assert_redirected_to offer_url(Offer.last)
  end

  test "should show offer" do
    get offer_url(@offer)
    assert_response :success
  end

  test "should get edit" do
    sign_in_as(users(:one))
    get edit_offer_url(@offer)
    assert_response :success
  end

  test "should update offer" do
    sign_in_as(users(:one))
    patch offer_url(@offer), params: {
      offer: {
        apply_link: @offer.apply_link,
        city: @offer.city,
        company_name: "Updated Company",
        contract_type: @offer.contract_type,
        country: @offer.country,
        description: Faker::Lorem.paragraph,
        job_type: @offer.job_type,
        title: @offer.title,
        user_id: @offer.user_id
      }
    }
    assert_redirected_to offer_url(@offer)
  end

  test "should destroy offer" do
    sign_in_as(users(:one))
    assert_difference("Offer.count", -1) do
      delete offer_url(@offer)
    end

    assert_redirected_to offers_url
  end
end
