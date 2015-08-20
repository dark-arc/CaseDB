class EventsController < ApplicationController
  load_and_authorize_resource

  def index
    @event = Event.all
  end
  
  def create
    if @event.save
      redirect_to @event 
    else
      render 'new'
    end
  end
  
  def new
    @event = Event.new()
    puts params[:casefile]
    if params.has_key?(:casefile)
      @event.case_file = CaseFile.find(
        params[:casefile]
      )        
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
    params.require(:event).permit(:body, :date, :case_file_id,
                                  :event_people => [:person_id, :category])
  end
end

