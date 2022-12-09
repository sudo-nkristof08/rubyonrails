require "test_helper"

class CarTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
   
   test "Count number of test data" do
   	assert_equal 2, Car.count
   end
   
   test "Create a car without a owner" do
   	car = Car.new
   	car.brand = "Toyota"
  	car.model = "Avensis"
  	car.BHP = 1
  	car.mileage = 1
  	car.starting_price = 1
  	car.image = ""
   	assert !car.save, "Not working correctly"
   end
   
   test "Create a car" do
   	car = Car.new
   	car.brand = "Toyota"
  	car.model = "Avensis"
  	car.BHP = 1
  	car.mileage = 1
  	car.starting_price = 1
  	car.image = ""
  	car.user = User.first
   	assert car.save, "Not working correctly"
   end
   
   
end
