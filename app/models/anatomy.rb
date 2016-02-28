# The anatomy model is a hierarchical list of all possible anatomical
# locations. The purpose of this model is to locate a {Mark} on a {Person}.
#
# The functionality should be consumed by {Mark}
#
# @see Mark
# @see MarkType
# @see Person
class Anatomy < ActiveRecord::Base
  acts_as_nested_set

  # Get the path to the current object. This will be a string
  # containing the name of this element as well as all ancestors.
  # @return [String] path to this object.
  def path
    path = ''
    ancestors.each do |anc|
      path += "#{anc.name}/"
    end
    path += name
    path
  end

  # @!attribute [rw] name
  # The name of this part.
end
