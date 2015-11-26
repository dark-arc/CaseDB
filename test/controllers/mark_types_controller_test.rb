require 'test_helper'

class MarkTypesControllerTest < ActionController::TestCase
  setup do
    @mark_type = mark_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mark_type" do
    assert_difference('MarkType.count') do
      post :create, params: { mark_type: {  } }
    end

    assert_redirected_to mark_type_path(MarkType.last)
  end

  test "should show mark_type" do
    get :show, params: { id: @mark_type }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @mark_type }
    assert_response :success
  end

  test "should update mark_type" do
    patch :update, params: { id: @mark_type, mark_type: {  } }
    assert_redirected_to mark_type_path(@mark_type)
  end

  test "should destroy mark_type" do
    assert_difference('MarkType.count', -1) do
      delete :destroy, params: { id: @mark_type }
    end

    assert_redirected_to mark_types_path
  end
end
