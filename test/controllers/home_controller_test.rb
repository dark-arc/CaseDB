require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  ## Section : Routing
  test "Routing: Home" do
    assert_routing '/',
                   controller: "home",
                   action: "index"
  end

  test "Routing: About" do
    assert_routing '/about',
                   controller: "home",
                   action: "about"
  end
end
