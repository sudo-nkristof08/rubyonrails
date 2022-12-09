require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @car1 = cars(:one)
    sign_in User.first
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete bid_url(bids(:one))
      delete bid_url(bids(:two))
      delete car_url(cars(:one))
      delete car_url(cars(:two))
      delete user_url(@user)
    end
  end
end
