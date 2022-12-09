require "test_helper"

class UserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
   
   test "Cant create user without email" do
   	user = User.new
   	user.name = "Teszt Elek"
   	user.password = "Test123"
   	user.image = ""
   	assert !user.save, "Not working correctly"
   end
   
   test "Create user" do
   	user = User.new
   	user.name = "Teszt Elek"
   	user.password = "Test123"
   	user.image = "asd"
   	user.email = "test@gmail.com"
   	assert user.save, "Not working correctly"
   end
   
   
   test "Cant create 2 users with the same email" do
   	user = User.new
   	user.name = "Teszt Elek"
   	user.password = "Test123"
   	user.image = "asd"
   	user.email = "test@gmail.com"
   	user.save
   	user2 = User.new
   	user2.name = "Teszt Elek"
   	user2.password = "Test123"
   	user2.image = "asd"
   	user2.email = "test@gmail.com"
   	
   	assert !user2.save, "Not working correctly"
   end
   
   test "Count number of test data" do
   	assert_equal 1, User.count
   end
   
   
   
end
