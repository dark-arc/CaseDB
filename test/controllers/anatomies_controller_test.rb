require 'test_helper'

class AnatomiesControllerTest < ActionController::TestCase
  setup do
    @anatomy = anatomies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anatomy" do
    assert_difference('Anatomy.count') do
      post :create, params: { anatomy: {  } }
    end

    assert_redirected_to anatomy_path(Anatomy.last)
  end

  test "should show anatomy" do
    get :show, params: { id: @anatomy }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @anatomy }
    assert_response :success
  end

  test "should update anatomy" do
    patch :update, params: { id: @anatomy, anatomy: {  } }
    assert_redirected_to anatomy_path(@anatomy)
  end

  test "should destroy anatomy" do
    assert_difference('Anatomy.count', -1) do
      delete :destroy, params: { id: @anatomy }
    end

    assert_redirected_to anatomies_path
  end
end
