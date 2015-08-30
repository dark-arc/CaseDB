class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |e|
    redirect_to root_url, :alert => e.message
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    flash[:alert] = e.message
    redirect_to action: :index
  end
  
  def current_user
    User.find_by_id session[:user_id]
  end
end
