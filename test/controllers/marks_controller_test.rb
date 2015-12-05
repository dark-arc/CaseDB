require 'test_helper'

class MarksControllerTest < ActionController::TestCase
  setup do
    @mark = build :mark
    @person = create :person
    @params = { user_id: create(:user, :admin).id }
  end

  test "should get index" do
    get :index,
        params: {person_id: @person.id},
        session: @params
    assert_response :success
  end

  test "should get new" do
    get :new,
        params: {person_id: @person.id},
        session: @params
    assert_response :success
  end

  test "should create mark" do
    assert_difference('Mark.count') do
      post :create,
           params: {
             person_id: @person.id,
             mark: {
               description: @mark.description,
               anatomy_id: @mark.anatomy_id,
               mark_type_id: @mark.mark_type_id
             }
           },session: @params
    end

    assert_redirected_to person_path(@person)
  end

  test "should show mark" do
    save_setup
    get :show, params: {person_id: @person, id: @mark },
        session: @params
    assert_response :success
  end
  
  test "should get edit" do
    save_setup
    get :edit, params: {person_id: @person, id: @mark },
        session: @params
    assert_response :success
  end

  test "should update mark" do
    save_setup
    patch :update,
          params: {
            person_id: @person,
            id: @mark,
            mark: {description: "s"},
          },
          session: @params
    assert_redirected_to person_path(@person)
  end

  test "should destroy mark" do
    save_setup
    assert_difference('Mark.count', -1) do
      delete :destroy, params: {
               person_id: @person,
               id: @mark
             },session: @params
    end

    assert_redirected_to person_path(@person)
  end
end
