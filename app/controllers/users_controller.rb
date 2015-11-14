class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end
  
  def new
    @user = User.new()
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

  def edit
    @user = User.find(params[:id])
    render 'new'
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    if params[:user][:password] == nil ||
       params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if cannot? :promote, User
      params[:user].delete(:roles)
    end
    params.require(:user).
      permit(
        :username,
        :email,
        :theme,
        {:roles => []},
        :password,
        :password_confirmation
      )
  end
end
