require 'test_helper'

class CaseFileTest < ActiveSupport::TestCase
  test "case_file must have brief between 50..500" do
    file = case_files(:jack)
    assert file.valid?,
           "test requires jack to be valid"
    file.brief = nil
    assert_not file.valid?
    file.brief = "a"*49
    assert_not file.valid?
    file.brief = "a"*50
    assert file.valid?
    file.brief = "a"*500
    assert file.valid?
    file.brief = "a"*501
    assert_not file.valid?
  end
  test "case_file must have name between 5..50" do
    file = case_files(:jack)
    assert file.valid?,
           "test requires jack to be valid"
    file.name = nil
    assert_not file.valid?
    file.name = "a"*4
    assert_not file.valid?
    file.name = "a"*5
    assert file.valid?
    file.name = "a"*50
    assert file.valid?
    file.name = "a"*51
    assert_not file.valid?
  end
end
