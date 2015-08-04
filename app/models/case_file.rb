class CaseFile < ActiveRecord::Base
  has_many :events,
           -> {order('date')}
  has_many :event_people,
           :through => :events
  has_many :people,
           :through => :event_people
  
  EventPerson.categories.each do |type|
  has_many type[0].pluralize.to_sym,
           -> {where 'event_people.category' => type[0].to_sym},
           :through => :event_people,
           :source => :person
  end
end
