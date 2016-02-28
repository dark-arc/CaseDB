require 'test_helper'

# Controller for Anatomies
class AnatomiesControllerTest < ActionController::TestCase
  setup do
    @anatomy = build :anatomy
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

  test 'should create anatomy' do
    assert_difference('Anatomy.count') do
      post :create,
           params: {
             anatomy: { name: @anatomy.name }
           }, session: @params
    end

    assert_redirected_to anatomy_path(Anatomy.last)
  end

  test 'should show anatomy' do
    @anatomy.save
    get :show,
        params: { id: @anatomy },
        session: @params
    assert_response :success
  end

  test 'should get edit' do
    @anatomy.save
    get :edit,
        params: { id: @anatomy },
        session: @params
    assert_response :success
  end

  test 'should update anatomy' do
    @anatomy.save
    patch :update,
          params: {
            id: @anatomy,
            anatomy: { name: 'test' } },
          session: @params
    assert_redirected_to anatomy_path(@anatomy)
  end

  test 'should destroy anatomy' do
    @anatomy.save
    assert_difference('Anatomy.count', -1) do
      delete :destroy,
             params: { id: @anatomy },
             session: @params
    end

    assert_redirected_to anatomies_path
  end
end
