require 'test_helper'
# Tests for session controller
class SessionControllerTest < ActionController::TestCase
  test 'should get login page if not logged in' do
    get :new
    assert_response :success
  end

  test 'should deny access to login page if logged in' do
    get :new,
        session: { user_id: create(:user, :user).id }
    assert_response 403
  end

  test 'should create session' do
    user = create(:user, :user)
    user.password = 'ReallyBadPassword'
    post :create,
         params: {
           session: {
             username: user.username,
             password: user.password
           }
         }
    assert_equal user.id, @controller.current_user.id
  end

  test 'should not create session' do
    user = create(:user, :user)
    user.password = 'ReallyGoodPassword'
    post :create,
         params: {
           session: {
             username: user.username,
             password: user.password
           }
         }
    assert_nil @controller.current_user
  end

  test 'should destroy session' do
    user = create(:user, :user)
    delete :destroy,
           params: { id: user.id },
           session: { user_id: user.id }
    assert_nil @controller.current_user
  end
end
