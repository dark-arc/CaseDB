class PeopleController < ApplicationController
  load_and_authorize_resource
  
  def index
    
  end
  
  def create
    if @person.save!
      redirect_to @person 
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
    if @person.update!(person_params)
      redirect_to @person
    else
      render 'edit'
    end
  end
  
  def destroy
    @person.destroy()
    redirect_to people_path
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
