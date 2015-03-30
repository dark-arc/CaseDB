class EventType < ActiveRecord::Base
  has_many :person_event_links
  has_many :events, :through => :person_event_links
	
	def self.death
		EventType.where(name: 'Death').first
	end
	def self.birth
		EventType.where(name: 'Birth').first
	end
end
