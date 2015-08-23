class SessionController < ApplicationController
  def new
    @user= User.new
  end

  def create
    user = User.authenticate(params[:session][:username], params[:session][:password])
    if user 
      session[:user_id] = user.id
      flash[:notice] = "Logged in as #{user.username}"
      redirect_to(root_path)
    else
      flash[:notice] = "Invalid username or password.}"
      render 'new'
    end
  end
end
