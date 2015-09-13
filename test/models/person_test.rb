require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "Person may only have one birth Event" do
    person = create :person
    person.birth << create(:event)
    person.birth << create(:event)
    assert_not person.valid?
  end
  test "Person may only have one death Event" do
    person = create :person
    person.death << create(:event)
    person.death << create(:event)
    assert_not person.valid?
  end
end
