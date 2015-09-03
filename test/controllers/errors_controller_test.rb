require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  @@errorController = {
    controller: "errors",
    action: "show",
    code: 500,
    format: :html
  }

  test "404" do
    assert_routing '/404', @@errorController
  end
  test "422" do
    assert_routing '/422', @@errorController
  end
  test "500" do
    assert_routing '/500', @@errorController
  end
end
