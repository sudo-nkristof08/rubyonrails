require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    sign_in users(:one)
  end

  test "should update User" do
    visit edit_user_url(@user)

    fill_in "Name", with: "TesztElek"
    click_on "Update User"

    assert_text "User was successfully updated"
  end

end
