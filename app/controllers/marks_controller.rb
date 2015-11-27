class MarksController < ApplicationController
  load_and_authorize_resource :person
  load_and_authorize_resource :mark, :through => :person

  # GET /marks
  def index

  end

  # GET /marks/1
  def show

  end

  # GET /marks/new
  def new

  end

  # GET /marks/1/edit
  def edit
  end

  # POST /marks
  def create
    @mark = Mark.new(mark_params)
    @mark.person = @person
    if @mark.save
      redirect_to [@person,@mark],
                  notice: 'Mark was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /marks/1
  def update
    if @mark.update(mark_params)
      redirect_to @mark, notice: 'Mark was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /marks/1
  def destroy
    @mark.destroy
    redirect_to marks_url, notice: 'Mark was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
  def mark_params
      params.require(:mark).permit!
    end
end
