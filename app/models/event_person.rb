class EventPerson < ActiveRecord::Base
  enum  categories: [
          :birth,
          :death,
          :victim,
          :suspect,
          :perpetrator,
          :investigator          
        ]
end
