# Events model
class Event < ActiveRecord::Base
  default_scope { order(:date) }
  # @attribute case_file
  # The case file the event belongs to
  belongs_to :case_file, touch: true
  has_many :event_people
  # @attribute people
  # The people associated with the case
  has_many :people,
           through: :event_people

  validates :body,
            presence: true,
            length: { minimum: 20 }

  accepts_nested_attributes_for :event_people,
                                allow_destroy: true

  EventPerson.categories.each do |type|
    has_many type[0].pluralize.to_sym,
             -> { where 'event_people.category' => type[0].to_sym },
             through: :event_people,
             source: :person
  end
  # @attribute tagline
  # A tagline for the case, this can be set manually or if unset will
  # be the first sentence of the body.
  def tagline
    return body.split('. ').first if
      super.nil?
    super
  end
end
