require 'test_helper'

# Helper for People Testing
class PeopleHelperTest < ActionView::TestCase
  def add_name(person)
    name = Faker::Name.name
    assert_difference('person.aliases.count', 1) do
      person.name = name
    end
    assert_equal person.name, name
    name
  end
end
