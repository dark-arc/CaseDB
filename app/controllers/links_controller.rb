class LinksController < ApplicationController
	def new
		@link = PersonEventLink.new
		@event = Event.new
		@type = EventType.first
		
		if params.key?(:case_id)
			@case = Case.find(params[:case_id])
		end
		
		if params.key?(:event_type_id)
			@type = EventType.find(params[:event_type_id])
		end
		
		if params.key?(:event_id)
			@event = Event.find(params[:event_id])
		end
		
		if params.key?(:person_id)
			@person = Person.find(params[:person_id])
			@link.person=@person
			@link.event_type=@type
			@event.person_event_links<<@link
		end
		
		render 'events/new'
	end
	
	def edit
		@link = EventLink.find(params[:id])
		@event = @link.event
		@type = @link.event_type
		
		render 'events/new'
	end
end
