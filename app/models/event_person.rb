# EventPerson links the event and people models, it also provides a
# categorisation for the linking.
class EventPerson < ActiveRecord::Base
  belongs_to :person
  belongs_to :event

  accepts_nested_attributes_for :event, :person

  # @attribute category
  #  defines the type of link between the event/person
  enum category: [
         :birth,
         :death,
         :victim,
         :perpetrator,
         :investigator
       ]
end
