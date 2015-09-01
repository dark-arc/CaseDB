class CaseFilesController < ApplicationController
  load_and_authorize_resource

  def index
    @case_files = CaseFile.all
  end
  
  def create
    if @case_file.save
      redirect_to @case_file 
    else
      render 'new'
    end
  end
  
  def new
    @case_file = CaseFile.new()
  end
  
  def show
    @case_file = CaseFile.find(params[:id])
  end
  
  def edit
    @case_file = CaseFile.find(params[:id])
  end
  
  def update
    if @case_file.update(case_file_params)
      redirect_to @case_file
    else
      render 'edit'
    end
  end
  
  def destroy
    if CaseFile.exists?(params[:id])
      @case_file = CaseFile.find(params[:id])
      @case_file.destroy()
      @success = true
    else
      @success = false
    end
    redirect_to @case_file
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
