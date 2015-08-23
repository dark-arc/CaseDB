class EventPerson < ActiveRecord::Base
  belongs_to :event
  belongs_to :person

  enum  category: [
          :birth,
          :death,
          :victim,
          :suspect,
          :perpetrator,
          :investigator          
        ]
  EventPerson.categories.each do |type|
    scope type[0].to_sym,
          -> { where category: type[0].to_sym }
  end    
end
