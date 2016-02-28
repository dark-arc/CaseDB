# Displays errors to the user (static pages)
class ErrorsController < ApplicationController
  skip_load_resource
  skip_authorize_resource

  def show
    render status_code.to_s, status: status_code
  end

  private

  def status_code
    params[:code] || 500
  end
end
