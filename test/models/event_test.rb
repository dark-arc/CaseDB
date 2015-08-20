require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def test_tagline
    event = Event.new
    event.body = "Hello World. Hi There."
    assert event.tagline == "Hello World",
           "Tagline does not take data from body when no value is supplied"
    event.tagline = "Hi"
    assert event.tagline == "Hi",
           "Tagline still takes value of body after being set"
  end

  def test_date_order
    sql = Event.all.to_sql
    assert sql =~ /Order by.*date/i,
           "Events are not ordered by date"
  end
end
