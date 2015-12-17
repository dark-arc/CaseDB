require 'test_helper'

# Tests for the mark_type model
class MarkTypeTest < ActiveSupport::TestCase
  test 'Can create a mark' do
    type = build :mark_type
    assert type.save
  end

  test 'Can add sub-types' do
    parent = create :mark_type
    child = create :mark_type

    parent.children << child
    parent.save
    assert_equal 1, parent.children.count
  end
end
