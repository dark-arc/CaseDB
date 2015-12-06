# all controllers inherit from this. Actions here affect every
# controller.
class ApplicationController < ActionController::Base
  load_and_authorize_resource
  before_action :paginate_resource, only: [:index]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # check_authorization
  rescue_from CanCan::AccessDenied do |e|
    @message = e.message
    render 'errors/403', status: 403
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    flash[:alert] = e.message
    redirect_to action: :index
  end

  def current_user
    User.find_by_id session[:user_id]
  end

  def paginate_resource
    current = instance_variable_get("@#{controller_name}")
    return nil if current.nil?
    instance_variable_set("@#{controller_name}",
                          current.page(params[:page]).per(2))
  end
end
