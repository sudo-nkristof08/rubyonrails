require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  setup do
    @car = cars(:one)
    sign_in users(:one)
  end

  test "visiting the index" do
    visit cars_url
    assert_selector "h1", text: "Current Cars"
  end

end
