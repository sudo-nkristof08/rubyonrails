require "test_helper"

class UploadAvatarTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  test "upload image to the user" do
  
  	sign_in User.first
  	get edit_user_path(users(:one).id)
  	assert_response :success
  	assert_select "legend", "Set Profile Picture"
  	
  	file = fixture_file_upload("test/fixtures/files/lambo.jpg", 'image/jpg')
  	patch user_path(users(:one).id, params: {'file': file})
  	
  end
  
end
