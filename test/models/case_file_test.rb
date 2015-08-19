require 'test_helper'

class CaseFileTest < ActiveSupport::TestCase
  test "Name validation" do
    c = CaseFile.new
    assert c.invalid?, "CaseFile can be saved without name"
    c.name = "a"*4
    assert c.invalid?, "Name cannot be less than 4 chars"
    c.name = "a"*51
    assert c.invalid, "Name can be over 50 chars"
  end

  test "Brief validation" do
    c = CaseFile.new
    assert c.invalid?, "Casefile can be saved without brief"
  end

end
