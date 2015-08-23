class UsersController < ApplicationController
  #load_and_authorize_resource

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    if @user.save
      flash[:notice] = "Successfully signed up."
    end
    render 'new'
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).
      permit(
        :username,
        :email,
        :password,
        :password_confirmation
      )
  end
end
