require "test_helper"


class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car = cars(:one)
    sign_in User.first
  end

  test "should get index" do
    get cars_url
    assert_response :success
  end

  test "should get new" do
    get new_car_url
    assert_response :success
  end

  test "should create car" do
    assert_difference("Car.count") do
      post cars_url, params: { car: { BHP: @car.BHP, brand: @car.brand, image: @car.image, mileage: @car.mileage, model: @car.model, starting_price: @car.starting_price, user_id: @car.user_id } }
    end

    assert_redirected_to car_url(Car.last)
  end

  test "should show car" do
    get car_url(@car)
    assert_response :success
  end

  test "should update car" do
    patch car_url(@car), params: { car: { BHP: @car.BHP, brand: @car.brand, image: @car.image, mileage: @car.mileage, model: @car.model, starting_price: @car.starting_price, user_id: @car.user_id } }
    assert_redirected_to car_url(@car)
  end

end
