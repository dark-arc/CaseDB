require 'test_helper'

class UsersControllerTest < ActionController::TestCase
   test "permissions (user)" do
     user = users(:user)
     get :index
     assert_response :success
     get(:edit, {:id => user.id})
     assert_response :success, "User can edit self"
   end
end
