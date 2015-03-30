class CaseFilesController < ApplicationController
	def index
		@file = CaseFile.all
	end
  
	def search
# Not yet implemented
	end
  
	def create
		@file = CaseFile.new(case_params)
		if @file.save
			redirect_to @file 
		else
			render 'new'
		end
	end
  
	def new
		@file = CaseFile.new()
	end
  
	def show
		@file = CaseFile.find(params[:id])
	end
  
	def edit
		@file = CaseFile.find(params[:id])
	end
  
	def update
		@file = CaseFile.find(params[:id])
		if @file.update(case_params)
			redirect_to @file
		else
			render 'edit'
		end
	end
  
	def destroy
		if CaseFile.exists?(params[:id])
			@file = CaseFile.find(params[:id])
			@file.destroy()
			@success = true
		else
			@success = false
		end
		redirect_to @file
	end
	# Define case event linking and unlinking
	def link
		@file = CaseFile.find(params[:id]) 
		@event = Event.all
	end
  
	private
	def case_params
		params.require(:case_file).permit!
	end
end
