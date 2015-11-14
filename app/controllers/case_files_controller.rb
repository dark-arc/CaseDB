class CaseFilesController < ApplicationController
  load_and_authorize_resource

  def index

  end
  
  def create
    if @case_file.save
      redirect_to @case_file 
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
    if @case_file.update(case_file_params)
      redirect_to @case_file
    else
      render 'edit'
    end
  end
  
  def destroy
      @case_file.destroy()
      redirect_to case_files
  end
  # Define case event linking and unlinking
  def link
    @case_file = CaseFile.find(params[:id]) 
    @event = Event.all
  end
  
  private
  def case_file_params
    params.require(:case_file).permit(:name,:brief)
  end
end
