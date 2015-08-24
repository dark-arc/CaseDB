class LinksController < ApplicationController
  load_and_authorize_resource
  def new
    @link = EventPerson.new
    @event = Event.new
    @type = :birth
    
    if params.key?(:case_id)
      @case = Case.find(params[:case_id])
       end
      
      if params.key?(:event_type)
	@type = params[:event_type]
      end
      
      if params.key?(:event_id)
	@event = Event.find(params[:event_id])
      end
      
      if params.key?(:person_id)
	@person = Person.find(params[:person_id])
	@link.person=@person
	@link.category=@type
	@event.event_people<<@link
      end
      
      render 'events/new'
    end
    
    def edit
      @link = EventLink.find(params[:id])
      @event = @link.event
      @type = @link.category
      
      render 'events/new'
    end
  end
  
