require 'test_helper'

# Helper for Marks Controller Testing
class MarksControllerTest < ActionController::TestCase
  def save_setup
    @mark.person = @person
    @person.save
    @mark.save
  end
end
