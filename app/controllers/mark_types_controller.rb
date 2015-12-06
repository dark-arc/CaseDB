# Mark types should only be configurable by administrators they can be
# used for categorising marks
class MarkTypesController < ApplicationController
  # GET /mark_types
  def index
  end

  # GET /mark_types/1
  def show
  end

  # GET /mark_types/new
  def new
  end

  # GET /mark_types/1/edit
  def edit
  end

  # POST /mark_types
  def create
    logger.debug @mark_type
    if @mark_type.save!
      logger.debug 'saved'
      redirect_to @mark_type, notice: 'Mark type was successfully created.'
    else
      logger.debug 'not '
      render :new
    end
  end

  # PATCH/PUT /mark_types/1
  def update
    if @mark_type.update(mark_type_params)
      redirect_to @mark_type, notice: 'Mark type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mark_types/1
  def destroy
    @mark_type.destroy
    redirect_to mark_types_url, notice: 'Mark type was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def mark_type_params
    params.require(:mark_type).permit(:name, :parent_id)
  end
end
