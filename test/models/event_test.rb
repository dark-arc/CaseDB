require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "Body validation" do
    event = Event.new
    assert event.invalid?, "Event does not require body"
    event.body = "a"*101
    assert event.valid?, "Event body allows more than 100 chars"
    event.body = "a"*100
    assert event.invalid?, "Event body does not allow 100 chars"
  end

  test "Tag line validation" do
    event = Event.new
    event.body = "Tagline"*5
    assert event.tagline == event.body, "Event tagline and brief do not match"
    event.body = "a"*19
    assert event.invalid?, "Event tagline can be smaller than 20 chars"
    event.body = "a"*20
    assert event.valid?, "Event tagline cannot be 20 chars"
    event.body = "a"*99
    assert event.valid?, "Event tagline cannot be 99 chars"
    event.body = "a"*100
    assert event.invalid?, "Event tagline can be over 100 chars"

    assert event.body = "a"*101
    assert event.invalid?, "Event body can expand tagline"
  end
end
