require 'role_model'
# The user model refers to the users of the site. It is a part of
# Devise. 
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include RoleModel

  roles_attribute :roles_mask
  # @attribute roles
  #  A user can have multiple roles, this is used for authorisation
  roles :admin,:editor,:researcher,:guest
end
