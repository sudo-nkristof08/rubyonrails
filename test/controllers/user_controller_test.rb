require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get cars" do
    get user_cars_url
    assert_response :success
  end
end
