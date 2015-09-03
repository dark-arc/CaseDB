require 'test_helper'

class CaseFilesControllerTest < ActionController::TestCase
  test "Guest can view index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:case_files)
  end
  test "Guest can view show" do 
    get :show, {id: case_files(:jack).id}
    assert_response :success
    assert_not_nil assigns(:case_file)
  end
  test "Guest cannot edit" do 
    get :edit, {id: case_files(:jack).id}
    assert_response :redirect
    assert_not flash[:alert].empty?
  end
  test "Researcher can edit" do
    get :edit, {id: case_files(:jack).id},
        {user_id: users(:researcher).id}

    assert_response :success
  end
  test "Invalid case ID shows index" do
    get :show, {id: 5000}
    assert_response :redirect
    assert_not flash[:alert].empty?
  end
end
