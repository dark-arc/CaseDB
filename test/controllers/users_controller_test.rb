require 'test_helper'
# Tests for User controller
class UsersControllerTest < ActionController::TestCase
  setup do
    @params = { user_id: create(:user, :admin).id }
    @user = build(:user)
  end

  test 'Guest can create' do
    get :new, session: { user_id: nil }
    assert_response :success
  end
  test 'Cannot edit others' do
    get :edit,
        params: { id: create(:user, :admin).id },
        session: { user_id: create(:user).id }
    assert_response 403
  end
  test 'Users cannot view index of users' do
    get :index, session: { user_id: create(:user).id }
    assert_response 403
  end
  test 'User accounts are created as user' do
    post :create, params: {
      user: {
        username: 'guest', email: 'guest@gslkdjf.com',
        theme: 'wine', password: '[FILTERED]',
        password_confirmation: '[FILTERED]' } }
    assert User.find_by_username('guest').roles.include?(:user),
           'Users are not created with role user'
  end

  test 'Users cannot create accounts as admin' do
    post :create, params: {
      user: {
        username: 'guest2', email: 'guest@gslkdjf.com',
        theme: 'wine', password: '[FILTERED]',
        roles: ['admin'], password_confirmation: '[FILTERED]' } }

    assert_not User.find_by_username('guest2').roles.include?(:admin),
               'Users can be created as admin'
  end

  test 'should get index' do
    get :index, session: @params
    assert_response :success
  end

  test 'should get new' do
    get :new, session: @params
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create,
           params:  { user: {
             email: @user.email,
             username: @user.username,
             password: @user.password,
             password_confirmation: @user.password
           } },
           session: @params
    end

    assert_redirected_to user_path(User.last)
  end

  test 'should show user' do
    @user.save
    get :show,
        params: { id: @user },
        session: @params
    assert_response :success
  end

  test 'should get edit' do
    @user.save
    get :edit,
        params: { id: @user },
        session: @params
    assert_response :success
  end

  test 'should update user' do
    @user.save
    patch :update,
          params: {
            id: @user,
            user: { name: 'test' } },
          session: @params
    assert_redirected_to user_path(@user)
  end
end
