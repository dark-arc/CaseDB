require 'test_helper'

# Controller for error pages
class ErrorsControllerTest < ActionController::TestCase
  def error_controller
    {
      controller: 'errors',
      action: 'show',
      format: :html
    }
  end

  test '404' do
    assert_routing '/404', error_controller.merge(code: 404)
  end
  test '422' do
    assert_routing '/422', error_controller.merge(code: 422)
  end
  test '500' do
    assert_routing '/500', error_controller.merge(code: 500)
  end
end
