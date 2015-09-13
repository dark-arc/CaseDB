require 'test_helper'

class CaseFilesControllerTest < ActionController::TestCase
  test "Guest can view index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:case_files)
  end
  test "Guest can view show" do
    c = create(:case_file)
    get :show, params: {id: c.id}
    assert_response :success
    assert_not_nil assigns(:case_file)
  end
  test "Guest cannot edit" do 
    c = create(:case_file)
    get :edit, params: {id: c.id}
    assert_response 403
    assert_not_nil assigns(:message)
  end
  test "Researcher can edit" do
    c = create(:case_file)
    get :edit, params: {id: c.id},
        session: {user_id: create(:user,:researcher).id}
    assert_response :success
  end
  test "Invalid case ID shows index" do
    get :show, params: {id: 5000}
    assert_response :redirect
    assert_not flash[:alert].empty?
  end
end
