require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  setup do
    @car = cars(:one)
  end

  test "visiting the index" do
    visit cars_url
    assert_selector "h1", text: "Cars"
  end

  test "should create car" do
    visit cars_url
    click_on "New car"

    fill_in "Bhp", with: @car.BHP
    fill_in "Brand", with: @car.brand
    fill_in "Image", with: @car.image
    fill_in "Mileage", with: @car.mileage
    fill_in "Model", with: @car.model
    fill_in "Starting price", with: @car.starting_price
    fill_in "User", with: @car.user_id
    click_on "Create Car"

    assert_text "Car was successfully created"
    click_on "Back"
  end

  test "should update Car" do
    visit car_url(@car)
    click_on "Edit this car", match: :first

    fill_in "Bhp", with: @car.BHP
    fill_in "Brand", with: @car.brand
    fill_in "Image", with: @car.image
    fill_in "Mileage", with: @car.mileage
    fill_in "Model", with: @car.model
    fill_in "Starting price", with: @car.starting_price
    fill_in "User", with: @car.user_id
    click_on "Update Car"

    assert_text "Car was successfully updated"
    click_on "Back"
  end

  test "should destroy Car" do
    visit car_url(@car)
    click_on "Destroy this car", match: :first

    assert_text "Car was successfully destroyed"
  end
end
