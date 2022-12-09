require "test_helper"

class BidOnCarTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "test bid on car" do
  	
  	# prerequisite
  	delete bid_url(bids(:one))
  	delete bid_url(bids(:two))
  	
  	# Check if only other users cars show up
  	sign_in users(:two)
  	get cars_url()
  	assert_response :success
  	assert_select "h2", "Toyota Avensis", 1
  	assert_select "h2", {count: 0, text:"Ford Focus"}
  	
  	sign_in users(:one)
  	get cars_url()
  	assert_response :success
  	assert_select "h2", "Ford Focus", 1
  	assert_select "h2", {count: 0, text:"Toyota Avensis"}
	

	# Make Bid
  	post createBid_url(cars(:two).id), params: {car_id: cars(:two).id , amount: 2 }
  	assert_response :redirect
  	
  	# Show bids
  	get showBids_url(users(:two).id)
  	assert_response :success
  	assert_select "h2", "1$", 1
  	assert_select "a", {count: 1, text:"Ford Focus"}
  	
  	# Make another Bid, should show 2 bids
  	post createBid_url(cars(:two).id), params: {car_id: cars(:two).id , amount: 3 }
  	assert_response :redirect
  	get showBids_url(users(:two).id)
  	assert_response :success
  	assert_select "a", {count: 2, text:"Ford Focus"}
  	
  	# Try to make a lower Bid, still only 2 bids
  	post createBid_url(cars(:two).id), params: {car_id: cars(:two).id , amount: 1 }
  	assert_response 204
  	
  	get showBids_url(users(:two).id)
  	assert_response :success
  	assert_select "a", {count: 2, text:"Ford Focus"}

  	# Check car page, should only show users(:one) bids
  	get car_url(cars(:two).id)
  	assert_response :success
  	assert_select "h1", {count: 2, text: users(:one).name }
  	
  	# Try to delete a car with bids
  	sign_in users(:one)
  	delete car_url(cars(:two).id)
  	assert_response :forbidden
  	
  end
  
  
  
end
