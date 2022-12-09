require "test_helper"

class BidTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
   
   test "Create a bid" do
   
   	bid = Bid.new
   	bid.user = User.first
   	bid.car = cars(:one)
   	bid.amount = 1
   	
   	assert bid.save, "Not working correctly"
   
   end
   
end
