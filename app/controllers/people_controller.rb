class PeopleController < ApplicationController
  load_and_authorize_resource

  def index
    @person = Person.all
  end
  
  def create
    if @person.save!
      if ! params[:person][:event_id].blank?
      @event = Event.find(params[:person][:event_id])
      @person.event << @event
      end
      redirect_to @person 
    else
      render 'new'
    end
  end
  
  def new
    if ! params[:event].blank?
      @event = Event.find(params[:event].to_i)
    end
    @person = Person.new()
  end
  
  def show
    @person = Person.find(params[:id])
  end
  
  def edit
    @person = Person.find(params[:id])
  end
  
  def update
    @person = Person.find(params[:id])
    if @person.update!(person_params)
      redirect_to @person
    else
      render 'edit'
    end
  end
  
  def destroy
    if Person.exists?(params[:id])
      @case = Person.find(params[:id])
      @case.destroy()
      @success = true
    else
      @success = false
    end
    redirect_to action: 'index'
  end

  private
  def person_params
    params.require(:person).permit(:name, :gender, :height,
                                   :build, :eye_colour, :hair_colour,
                                   :hair_length, :moustache, :beard,
                                   :ic, :aliases_attributes => [
                                     :id,:_destroy,:name])
  end

end
