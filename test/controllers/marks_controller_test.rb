require 'test_helper'

class MarksControllerTest < ActionController::TestCase
  setup do
    @mark = marks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mark" do
    assert_difference('Mark.count') do
      post :create, params: { mark: {  } }
    end

    assert_redirected_to mark_path(Mark.last)
  end

  test "should show mark" do
    get :show, params: { id: @mark }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @mark }
    assert_response :success
  end

  test "should update mark" do
    patch :update, params: { id: @mark, mark: {  } }
    assert_redirected_to mark_path(@mark)
  end

  test "should destroy mark" do
    assert_difference('Mark.count', -1) do
      delete :destroy, params: { id: @mark }
    end

    assert_redirected_to marks_path
  end
end
