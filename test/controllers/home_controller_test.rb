require 'test_helper'
# Tests for home controller
class HomeControllerTest < ActionController::TestCase
  test 'Routing: Home' do
    assert_routing '/',
                   controller: 'home',
                   action: 'index'
  end

  test 'Routing: About' do
    assert_routing '/about',
                   controller: 'home',
                   action: 'about'
  end
end
