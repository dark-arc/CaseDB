ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
module ActiveSupport
  ActiveRecord::Migration.maintain_test_schema! if
    defined?(ActiveRecord::Migration)
  # Methods in this class will be available to all test cases.
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in
    #  alphabetical order.  fixtures :all
    include FactoryGirl::Syntax::Methods

    # Adds a name to the specified person and tests that it was added.
    # @param [Person] person to add to
    # @return [String] the name added
    def add_name(person, name = nil)
      name = Faker::Name.name if name.nil?
      person.name = name
      assert_equal person.name, name
      name
    end
  end
end
