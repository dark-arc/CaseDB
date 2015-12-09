# This class maps marks to people. This should be consumed by {Person}
# and should not need to be used directly.
# @see Person
class Mark < ActiveRecord::Base
  # @!attribute [rw] person
  # Gets the person associated with this mark
  # @see Person
  belongs_to :person
  # @!attribute [rw] anatomy
  # Gets the location of the mark
  # @see Anatomy
  belongs_to :anatomy
  # @!attribute [rw] mark_type
  # Gets the type of mark (such as scar, tattoo, etc).
  # @see MarkType
  belongs_to :mark_type
  # @!attribute [r] path
  # Gets the "path" for the mark type, this will be more descriptive
  # than getting the name as it will be something like "tattoo/tribal"
  # rather than "tribal" which has less meaning
  delegate :path, to: :mark_type
end
