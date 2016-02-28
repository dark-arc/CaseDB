# A {CaseFile} is a grouping of the other core models. The model
# provides the "story" of the case, using {Person}, {Event},
# {Location} to give the narrative.
#
# Assigning an {Event} to a {CaseFile} will show the event in all
# apropriate views. Conversly not assigning the {Event} a {CaseFile}
# will hide it from view. This can be useful for background
# information (such as birth events which are largely incidental to
# the case.
class CaseFile < ActiveRecord::Base
  # @!attribute [rw] events
  # A case file has many events, these provide the narrative for the
  # case
  has_many :events
  has_many :event_people,
           through: :events
  # @!attribute [r] people
  # The people involved in this case. This is an indirect
  # association. People can only be assigned to the case via an event
  # (i.e. only if they participated in some way).
  has_many :people,
           through: :event_people
  # @!attribute [rw] brief
  # The case brief. This should include an overview of the case and
  # its outcome as a Markdown document.
  validates :brief,
            presence: true,
            length: { minimum: 50 }
  # @!attribute [rw] name
  # The name of the case should be a "descriptive tag" such as 'Jack
  # the Ripper' or 'Jeremy Bamber'. This is what most people should
  # recognise.
  validates :name,
            presence: true

  def tagline
    return brief.split('. ').first if
      super.nil?
    super
  end
  
  EventPerson.categories.each do |type|
    has_many type[0].pluralize.to_sym,
             -> { where 'event_people.category' => type[0].to_sym },
             through: :event_people,
             source: :person
  end
end
