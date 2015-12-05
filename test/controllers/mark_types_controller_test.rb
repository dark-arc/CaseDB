require 'test_helper'

class MarkTypesControllerTest < ActionController::TestCase
  setup do
    @mark_type = build :mark_type
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

  test 'should create mark_type' do
    assert_difference('MarkType.count') do
      post :create,
           params: {
             mark_type:  { name: @mark_type.name }
           }, session: @params
    end

    assert_redirected_to mark_type_path(MarkType.last)
  end

  test 'should show mark_type' do
    @mark_type.save
    get :show, params: {
      id: @mark_type.id
    },
               session: @params

    assert_response :success
  end

  test 'should get edit' do
    @mark_type.save
    get :edit, params: {
      id: @mark_type
    },
               session: @params
    assert_response :success
  end

  test 'should update mark_type' do
    @mark_type.save
    patch :update, params: {
      id: @mark_type,
      mark_type: { name: 'test' }
    },
                   session: @params
    assert_redirected_to mark_type_path(@mark_type)
  end

  test 'should destroy mark_type' do
    @mark_type.save
    assert_difference('MarkType.count', -1) do
      delete :destroy, params: {
        id: @mark_type
      },
                       session: @params
    end

    assert_redirected_to mark_types_path
  end
end
