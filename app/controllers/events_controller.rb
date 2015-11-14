class EventsController < ApplicationController
  load_and_authorize_resource
  
  def index

  end
  
  def create
    if @event.save
      redirect_to @event 
    else
      render 'new'
    end
  end
  
  def new

  end
                                    
  def show
  
  end
  
  def edit

  end
  
  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end
  
  def destroy
      @event.destroy()
      redirect_to events_path
  end
  
  private
  def event_params
    params.require(:event).permit(:body, :date, :case_file_id,
                                  :event_people_attributes => [
                                    :person_id,
                                    :id,
                                    :category,
                                    :_destroy],
                                  :event_people => [
                                    :person_id,
                                    :category]
                                 )
  end
end

