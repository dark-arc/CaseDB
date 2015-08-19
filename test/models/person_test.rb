require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "Person may only have one birth Event" do
    person = Person.new
    person.birth << Event.new
    assert person.valid?, "Person must be able to have one birth event"
    person.birth << Event.new
    assert person.invalid?, "Cannot have multiple birth events"
  end
  test "Person may only have one death Event" do
    person = Person.new
    person.death << Event.new
    assert person.valid?, "Person must be able to have one death event"
    person.death << Event.new
    assert person.invalid?, "Cannot have multiple death events"
  end

  test "Person name validation" do
    person = Person.new
    assert person.invalid?, "Person is valid without name"
    person.name = 'a'*4
    assert person.invalid?, "Person name can be less than 5 characters"
    person.name = 'a'*201
    assert person.invalid?, "Person name can be greater than 200 characters"
  end

end
