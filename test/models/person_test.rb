require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "Person may only have one birth Event" do
    person = Person.new
    person.name = "a"*5
    person.birth << Event.new
    assert person.valid?, "Person must be able to have one birth event"
    person.birth << Event.new
    assert person.invalid?, "Cannot have multiple birth events"
  end
  test "Person may only have one death Event" do
    person = Person.new
    person.name = "a"*5
    person.death << Event.new
    assert person.valid?, "Person must be able to have one death event"
    person.death << Event.new
    assert person.invalid?, "Cannot have multiple death events"
  end
end
