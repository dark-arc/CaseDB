class EventPerson < ActiveRecord::Base
  belongs_to :person
  belongs_to :event

  accepts_nested_attributes_for :event, :person
  
  enum category: [
         :birth,
         :death,
         :victim,
         :perpetrator,
         :investigator
       ]
end
