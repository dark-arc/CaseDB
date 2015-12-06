# This class represents accounts on the website
class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    flash[:notice] = 'Successfully signed up.' if @user.save
    render 'new'
  end

  def show
  end

  def edit
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
    delete_password if params[:user][:password].nil? ||
                       params[:user][:password].blank?
    delete_roles if cannot? :promote, User
    params.require(:user)
      .permit(:username, :email, :theme,
              :password, :password_confirmation, roles: [])
  end

  def delete_roles
    params[:user].delete(:roles)
  end

  def delete_password
    params[:user].delete(:password)
    params[:user].delete(:password_confirmation)
  end
end
