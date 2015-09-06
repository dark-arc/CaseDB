require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "Person may only have one birth Event" do
    person = people(:jack)
    person.birth << events(:birth)
    person.birth << events(:death)
    assert_not person.valid?
  end
  test "Person may only have one death Event" do
    person = people(:jack)
    person.death << events(:birth)
    person.death << events(:death)
    assert_not person.valid?
  end
end
