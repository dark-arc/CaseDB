class EventsController < ApplicationController
  load_and_authorize_resource

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event 
    else
      render 'new'
    end
  end
  
  def new
    @event = Event.new()
    if params.has_key?(:casefile)
      @case = CaseFile.find(params[:casefile])
            @event.case_file = @case
		                end
       end
      
      def show
	@event = Event.find(params[:id])
      end
      
      def edit
	@event = Event.find(params[:id])
      end
      
      def update
	@event = Event.find(params[:id])
	if @event.update(event_params)
	  redirect_to @event
	else
	  render 'edit'
	end
      end
      
      def destroy
	if Event.exists?(params[:id])
	  @event = Event.find(params[:id])
	  @event.destroy()
	  @success = true
	else
	  @success = false
	end
	redirect_to CaseFile.new
      end
      
      private
      def event_params
        params.require(:event).permit!
      end
    end
    
