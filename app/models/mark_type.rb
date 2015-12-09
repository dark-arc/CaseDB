# This is a semi-static list of all possible mark types
class MarkType < ActiveRecord::Base
  acts_as_nested_set
  # @!attribute [rw] name
  # The name of this mark type.

  # Gets the path to the current object including all ancestors
  def path
    path = ''
    ancestors.each do |anc|
      path += "#{anc.name}/"
    end
    path += name
    path
  end
end
