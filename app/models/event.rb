# Events are the primary narative element. An event can be anything
# that has happened at any point in a {CaseFile} or in the life of a
# {Person}, including their birth and death.
class Event < ActiveRecord::Base
  default_scope { order(:date) }
  # @!attribute [rw] case_file
  # The case file the event belongs to. This can be nil if the event
  # is an "aside" such as the birth event of a judge, juror or csi.
  belongs_to :case_file, touch: true
  has_many :event_people
  # @!attribute [rw] people
  # The people associated with the event. People can be linked to an
  # event with a type, such as birth or death. This will aid the
  # narrative of the {CaseFile} or {Person}'s life. For example
  # associating a murder with a {CaseFile} will add the murder to the
  # case, add the date of death for the person and add to the
  # murderer's list of victims.
  has_many :people,
           through: :event_people
  # @!attribute [rw] body
  # A description of the event. The body should not rely on a
  # "previous" event as it will be shown in multiple places so the
  # context may be blocked.
  validates :body,
            presence: true,
            length: { minimum: 20 }

  # @!attribute [rw] date
  # The date and time of this event.

  accepts_nested_attributes_for :event_people,
                                allow_destroy: true

  EventPerson.categories.each do |type|
    has_many type[0].pluralize.to_sym,
             -> { where 'event_people.category' => type[0].to_sym },
             through: :event_people,
             source: :person
  end
  # @!attribute [rw] tagline
  # A tagline for the case, this can be set manually or if unset will
  # be the first sentence of the body.
  def tagline
    return body.split('. ').first if
      super.nil?
    super
  end
end
