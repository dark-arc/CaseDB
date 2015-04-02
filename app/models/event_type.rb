class EventType < ActiveRecord::Base
  has_many :person_event_links
  has_many :events, :through => :person_event_links
	
	scope :death, -> {where(name: 'Death').first}
	scope :birth, -> {where(name: 'Birth').first}
	scope :victim, -> {where(name: 'Victim').first}
	scope :investigator, -> {where(name: 'Investigator').first}
	scope :perpetrator, -> {where(name: 'Perpetrator').first}
end
