class EventType < ActiveRecord::Base
  has_many :person_event_links
  has_many :events, :through => :person_event_links
	
	def self.death
		EventType.where(name: 'Death').first
	end
	def self.birth
		EventType.where(name: 'Birth').first
	end
	def self.victim
		EventType.where(name: 'Victim').first
	end
	def self.investigator
		EventType.where(name: 'Investigator').first
	end
	def self.perpetrator
		EventType.where(name: 'Perpetrator').first
	end
end
