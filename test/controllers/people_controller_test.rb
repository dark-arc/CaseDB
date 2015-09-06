require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  test "Guest can view index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person)
  end
  test "Guest can view show" do 
    get :show, params: {id: people(:jack).id}
    assert_response :success
    assert_not_nil assigns(:person)
  end
  test "Guest cannot edit" do 
    get :edit, params: {id: people(:jack).id}
    assert_response 403
    assert_not_nil assigns(:message)
  end
  test "Researcher can edit" do
    get :edit, params: {id: people(:jack).id},
        session: {user_id: users(:researcher).id}
    assert_response :success
  end
  test "Invalid ID shows index" do
    get :show, params: {id: 5000}
    assert_response :redirect
    assert_not flash[:alert].empty?
  end
end
