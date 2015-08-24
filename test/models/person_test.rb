require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "Person may only have one birth Event" do
    person = Person.first
    person.birth = []
    person.birth << events(:birth)
    assert person.valid?, "Person must be able to have one birth event"
    person.birth << events(:death)
    assert person.invalid?, "Cannot have multiple birth events"
  end
  test "Person may only have one death Event" do
    person = Person.first
    person.death = []
    person.death << events(:death)
    assert person.valid?, "Person must be able to have one death event"
    person.death << events(:birth)
    assert person.invalid?, "Cannot have multiple death events"
  end
end
