require 'test_helper'
# Test case file controller
class CaseFilesControllerTest < ActionController::TestCase
  setup do
    @case_file = build :case_file
    @params = { user_id: create(:user, :admin).id }
  end

  test 'should get index' do
    get :index, session: @params
    assert_response :success
  end

  test 'should get new' do
    get :new, session: @params
    assert_response :success
  end

  test 'should create case_file' do
    assert_difference('CaseFile.count') do
      post :create,
           params:  { case_file: @case_file.attributes },
           session: @params
    end

    assert_redirected_to case_file_path(CaseFile.last)
  end

  test 'should show case_file' do
    @case_file.save
    get :show,
        params: { id: @case_file },
        session: @params
    assert_response :success
  end

  test 'should get edit' do
    @case_file.save
    get :edit,
        params: { id: @case_file },
        session: @params
    assert_response :success
  end

  test 'should update case_file' do
    @case_file.save
    patch :update,
          params: {
            id: @case_file,
            case_file: { name: 'test' } },
          session: @params
    assert_redirected_to case_file_path(@case_file)
  end

  test 'should destroy case_file' do
    @case_file.save
    assert_difference('CaseFile.count', -1) do
      delete :destroy,
             params: { id: @case_file },
             session: @params
    end

    assert_redirected_to case_files_path
  end
end
