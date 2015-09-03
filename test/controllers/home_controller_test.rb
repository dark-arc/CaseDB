require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  ## Section : Routing
  test "Routing: Home page" do
    assert_routing '/',
                   controller: "home",
                   action: "index"
    assert_routing '/index',
                   controller: "home",
                   action: "index"
  end

  test "Routing: About page" do
    assert_routing '/about',
                   controller: "home",
                   action: "about"
  end
end
