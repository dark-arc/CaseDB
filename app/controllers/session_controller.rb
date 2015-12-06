# Session controller handles user logins.
class SessionController < ApplicationController
  skip_load_resource
  def new
  end

  def create
    logger.warn create_params
    user = User.authenticate(create_params)
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in as #{user.username}"
      redirect_to(root_path)
    else
      flash[:notice] = 'Invalid username or password.}'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out.'
    redirect_to(root_path)
  end

  private

  def create_params
    params.require(:session).permit(:username, :password)
  end
end
