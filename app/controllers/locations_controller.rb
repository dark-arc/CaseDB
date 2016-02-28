class LocationsController < ApplicationController
  # GET /anatomies
  def index
  end

  # GET /anatomies/1
  def show
  end

  # GET /anatomies/new
  def new
  end

  # GET /anatomies/1/edit
  def edit
  end

  def create
    if @location.save
      redirect_to @location
    else
      render :new
    end
  end

  def update
    if @location.update(location_params)
      redirect_to @location
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end

  private

  def location_params
    params.require(:location).permit(:name,:parent_id,:level)
  end
end
