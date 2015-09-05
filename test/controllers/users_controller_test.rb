require 'test_helper'

class UsersControllerTest < ActionController::TestCase
   test "permissions (user)" do

   end

   test "User accounts are created as user" do
     post :create, params: {user: {username: "guest", email: "guest@gslkdjf.com", theme: "wine", password: "[FILTERED]", password_confirmation: "[FILTERED]"}}
     assert User.find_by_username("guest").roles.include?(:user),
            "Users are not created with role user"
   end

   test "Users cannot create accounts as admin" do
     post :create, params: {user: {username: "guest2", email: "guest@gslkdjf.com", theme: "wine", password: "[FILTERED]", roles: ["admin"], password_confirmation: "[FILTERED]"}}

     assert_not User.find_by_username("guest2").roles.include?(:admin),
                "Users can be created as admin"
   end
end
