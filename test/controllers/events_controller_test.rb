require 'test_helper'
# Tests for event controller
class EventsControllerTest < ActionController::TestCase
  setup do
    @event = build :event
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

  test 'should create event' do
    assert_difference('Event.count') do
      post :create,
           params:  { event: @event.attributes },
           session: @params
    end

    assert_redirected_to event_path(Event.last)
  end

  test 'should show event' do
    @event.save
    get :show,
        params: { id: @event },
        session: @params
    assert_response :success
  end

  test 'should get edit' do
    @event.save
    get :edit,
        params: { id: @event },
        session: @params
    assert_response :success
  end

  test 'should update event' do
    @event.save
    patch :update,
          params: {
            id: @event,
            event: { name: 'test' } },
          session: @params
    assert_redirected_to event_path(@event)
  end

  test 'should destroy event' do
    @event.save
    assert_difference('Event.count', -1) do
      delete :destroy,
             params: { id: @event },
             session: @params
    end

    assert_redirected_to events_path
  end
end
