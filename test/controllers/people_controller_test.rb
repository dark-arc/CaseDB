require 'test_helper'
# Tests for people controller
class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = build :person
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

  test 'should create person' do
    assert_difference('Person.count') do
      post :create,
           params:  { person: @person.attributes },
           session: @params
    end

    assert_redirected_to person_path(Person.last)
  end

  test 'should show person' do
    @person.save
    get :show,
        params: { id: @person },
        session: @params
    assert_response :success
  end

  test 'should get edit' do
    @person.save
    get :edit,
        params: { id: @person },
        session: @params
    assert_response :success
  end

  test 'should update person' do
    @person.save
    patch :update,
          params: {
            id: @person,
            person: { name: 'test' } },
          session: @params
    assert_redirected_to person_path(@person)
  end

  test 'should destroy person' do
    @person.save
    assert_difference('Person.count', -1) do
      delete :destroy,
             params: { id: @person },
             session: @params
    end

    assert_redirected_to people_path
  end
end
