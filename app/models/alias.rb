# Aliases reflect the need for a person to have multiple names.
#
# This model is proxied by the {Person} model and all interaction should
# happen through that model.
#
# @see Person
class Alias < ActiveRecord::Base
  belongs_to :person, touch: true
  scope :default_name, lambda {
    where(default: true)
  }
  scope :person, lambda { |person|
    where(person: person)
  }
  before_validation :check_defaults
  validates :default,
            uniqueness: {
              scope: [:person]
            }
  validates :name,
            uniqueness: {
              scope: [:person]
            }
  validates :person,
            presence: true

  def check_defaults
    return unless default_changed?
    defaults = Alias.person(person_id)
    defaults.update_all(default: false)
  end

  # @!attribute [rw] name
  # The "name" given to the person

  # @!attribute [rw] default
  # Specified whether this is the default name of the person. A person
  # should only ever have one default name.
end
