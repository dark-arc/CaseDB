class Person < ActiveRecord::Base
  has_many :person_event_links
  has_many :events, :through => :person_event_links, counter_cache: true
  has_many :case, -> {distinct}, :through => :event, counter_cache: true
  validates :name,
      presence:	true,
      format: {with: /\A[a-zA-Z0-9 ]+\z/, message: I18n.t('validation.alnum') },
      length: {minimum: 5}
  
  def getBirthEvent
    return getEvent('Birth')
  end
  
  def getDeathEvent
    return getEvent('Death')
  end
	
	def getEventLink(type)
		#model = Product.find(:first, :conditions => ["lower(name) = ?", name.downcase]) 
		t = EventType.where("name LIKE ?", type).first
		link = self.person_event_links.where("event_type_id = ?",t)
		if(link.empty?)
			PersonEventLink.new
		else
			link.first
		end
	end
  
  def getEvent(type)
		l=getEventLink(type)
		if(l.new_record?)
			return Event.new
		else
			return l.event
		end
#     t = EventType.find_by!(name: type).id
#     link = self.event_links.where("event_type_id = ?",t)
#     if(link.empty?)
# 			Event.new
#     else
# 			link.first.event
#     end
  end
end