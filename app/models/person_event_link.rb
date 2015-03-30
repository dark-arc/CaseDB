class PersonEventLink < ActiveRecord::Base
  belongs_to :event
  belongs_to :person
  belongs_to :event_type
  #TODO better validation of models to stop duplicate birthdays etc. 
  accepts_nested_attributes_for :event_type, :event, :person
  
  delegate :name, :to => :event_type, :prefix => :type , :allow_nil => true
end
