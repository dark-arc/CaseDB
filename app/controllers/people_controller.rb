class PeopleController < ApplicationController
  def index
    @person = Person.all
  end
  
  def search
    count = Person.search(params[:q]).count
    if count > 1
      case_setup(count)
      @case = Person.search(params[:q]).limit(@size).offset(@page*@size)
      render 'index'
    else
      redirect_to Person.search(params[:q]).take
    end
  end
  
  def create
    @person = Person.create(people_params)
    if @person.save
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
    if @person.update(people_params)
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
  def people_params
    params.require(:person).
      permit(
        :name,
        :gender,
        :eye,
        :hair_colour,
        :hair_length,
        :moustache,
        :beard,
        :ic
      )
  end
  def event_params
    params.require(:person).permit(:event_id)
  end
end
