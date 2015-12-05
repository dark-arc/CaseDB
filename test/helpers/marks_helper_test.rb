require 'test_helper'

class MarksControllerTest < ActionController::TestCase
  def save_setup
    @mark.person = @person
    @person.save
    @mark.save
  end
end
