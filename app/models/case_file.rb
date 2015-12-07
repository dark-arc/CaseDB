# CaseFile model
class CaseFile < ActiveRecord::Base
  # @attribute events
  # A case file has many events, these provide the narrative for the
  # case
  has_many :events
  has_many :event_people,
           through: :events
  # @attribute people
  # A case has many associated people. This lists all of them
  has_many :people,
           through: :event_people

  validates :brief,
            presence: true,
            length: { minimum: 50 }
  validates :name,
            presence: true

  EventPerson.categories.each do |type|
    has_many type[0].pluralize.to_sym,
             -> { where 'event_people.category' => type[0].to_sym },
             through: :event_people,
             source: :person
  end
end
