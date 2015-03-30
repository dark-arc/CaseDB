class Event < ActiveRecord::Base
  belongs_to :case_file, inverse_of: :events
  has_many :person_event_links
  has_many :people, :through => :person_event_links, counter_cache: true
  has_many :event_types, :through => :person_event_links
  
  accepts_nested_attributes_for :person_event_links
  
  validates :body, 
      presence: true,
      length: {minimum: 5}
  validates :date,
      presence: true
end
