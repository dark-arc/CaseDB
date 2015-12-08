# Aliases reflect the need for a person to have multiple names.
#
# This model is proxied by the {Person} model and all interaction should
# happen through that model.
#
# @see Person
class Alias < ActiveRecord::Base
  scope :default_name, -> { where(default: true).limit(1) }
  belongs_to :person, touch: true
  # @!attribute [rw] name
  # The "name" given to the person

  # @!attribute [rw] default
  # Specified whether this is the default name of the person. A person
  # should only ever have one default name.
end
