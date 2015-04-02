class Event < ActiveRecord::Base
  belongs_to :case_file, inverse_of: :events
  has_many :person_event_links
  has_many :people, :through => :person_event_links, counter_cache: true
  has_many :event_types, :through => :person_event_links
	has_many :victims,
			->{where 'person_event_links.event_type_id' => [EventType.death, EventType.victim]}, 
			:through => :person_event_links, 
			:source => :person
	has_many :investigators,
			->{where 'person_event_links.event_type_id' => EventType.investigator}, 
			:through => :person_event_links, 
			:source => :person
	has_many :perpetrators,
			->{where 'person_event_links.event_type_id' => EventType.perpetrator}, 
			:through => :person_event_links, 
			:source => :person
  
  accepts_nested_attributes_for :person_event_links
	attr_readonly :perpetrators, :investigators, :victims
	
	def tagline
		self[:tagline] || 
				self[:body].split('. ')[0]
	end
	
	def select_line
		"#{id.to_s.rjust(3,'0')} #{date} : #{tagline}"
	end
  
  validates :body, 
      presence: true,
      length: {minimum: 5}
  validates :date,
      presence: true
end
