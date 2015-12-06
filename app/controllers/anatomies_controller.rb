# Anatomies are selectable body parts which allow the Mark model to be
# linked to a location on a person's body.
class AnatomiesController < ApplicationController
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

  # POST /anatomies
  def create
    @anatomy = Anatomy.new(anatomy_params)

    if @anatomy.save
      redirect_to @anatomy, notice: 'Anatomy was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /anatomies/1
  def update
    if @anatomy.update(anatomy_params)
      redirect_to @anatomy, notice: 'Anatomy was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /anatomies/1
  def destroy
    @anatomy.destroy
    redirect_to anatomies_url, notice: 'Anatomy was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def anatomy_params
    params.require(:anatomy).permit(:name, :parent_id)
  end
end
