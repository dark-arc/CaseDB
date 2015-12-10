require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = build :person
  end
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

  test "description contain a list of all known attributes" do
    person = create :person
    assert_equal person.description, {}
    person = create :person, :with_description
    assert_not person.description.empty?
  end
end
