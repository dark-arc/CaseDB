require 'test_helper'

# Controller for error pages
class ErrorsControllerTest < ActionController::TestCase
  def errorController
    {
      controller: 'errors',
      action: 'show',
      format: :html
    }
  end

  test '404' do
    assert_routing '/404', errorController.merge(code: 404)
  end
  test '422' do
    assert_routing '/422', errorController.merge(code: 422)
  end
  test '500' do
    assert_routing '/500', errorController.merge(code: 500)
  end
end
